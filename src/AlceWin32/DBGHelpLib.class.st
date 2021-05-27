"
DBGHelpLib uniqueInstance initLibrary.
moduleId := DBGHelpLib uniqueInstance loadModule: 'ACEDAO.DLL'.
DBGHelpLib uniqueInstance unloadModule: moduleId.
 DBGHelpLib uniqueInstance enumerateSymbols: moduleId callback: [ :pSymbol :size : usc |  self traceCr: 'ada'.    true ]. 
 DBGHelpLib uniqueInstance enumerateModules: [ : moduleName : baseDll : void |  self traceCr:moduleName. true ]. 

Kernel32Lib uniqueInstance currentProcessHandle 
DGBEnumerateModules 
DGBEnumerateSymbols on: [ :moduleN :size : usc | self halt. ]. 

'C:\Program Files (x86)\Common Files\Microsoft Shared\OFFICE16\ACEDAO.DLL'asFileReference exists .
 
'C:\Program Files (x86)\Microsoft Office\root\Office16\ACEDAO.DLL' asFileReference exists .
"
Class {
	#name : #DBGHelpLib,
	#superclass : #FFILibrary,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'processHandle'
	],
	#pools : [
		'DBGHelpTypes'
	],
	#category : #AlceWin32
}

{ #category : #'reporting errors' }
DBGHelpLib >> defaultInvasive [
	^ true 
]

{ #category : #'reporting errors' }
DBGHelpLib >> defaultPath [
	^ nil
]

{ #category : #'reporting errors' }
DBGHelpLib >> defaultProcessHandle [
	^ Kernel32Lib uniqueInstance currentProcessHandle "90480 + ((Random seed: DateAndTime now asUnixTime) nextInt: 4000) "
]

{ #category : #'reporting errors' }
DBGHelpLib >> enumerateModules: aCallback [
	^ (self
		ffiEnumerateModules: self processHandle
		callback: (DGBEnumerateModules on: aCallback))
		ifFalse: [ self reportError: 0 ]
]

{ #category : #'reporting errors' }
DBGHelpLib >> enumerateSymbols: baseDLL callback: aCallback [
	^ (self
		ffiEnumerateSymbols: self processHandle
		baseDll: baseDLL
		matching: '*'
		callback: (DGBEnumerateSymbols on: aCallback))
		ifFalse: [ self reportError: 0 ] 
]

{ #category : #'reporting errors' }
DBGHelpLib >> enumerateTypes: baseDLL callback: aCallback [
	^ (self
		ffiDBGHelpEnumerateTypes: self processHandle
		baseDll: baseDLL
		callback: (DGBEnumerateSymbols on: aCallback))
		ifFalse: [ self reportError: 0 ] 
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpCleanUp: processHandleNumber [
	"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symcleanup
BOOL IMAGEAPI SymCleanup(
  HANDLE hProcess
);"

	^ self ffiCall: #(BOOL SymCleanup #(HANDLE processHandleNumber))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpEnumerateTypes: hProcess baseDll: baseDll callback: callback [

"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symenumtypes
BOOL IMAGEAPI SymEnumTypes(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);"

	^ self ffiCall:  #( BOOL SymEnumTypes #( HANDLE hProcess, ULONG64 baseDll, SYM_ENUMERATESYMBOLS_CALLBACK callback , nil ) )
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpInitializeLibraryWithProcessHandle: aNumber path: aPathString invasive: aBoolean [ 
"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-syminitialize
BOOL IMAGEAPI SymInitialize(
  HANDLE hProcess,
  PCSTR  UserSearchPath,
  BOOL   fInvadeProcess
);"
	^ self ffiCall: #(BOOL SymInitialize #(HANDLE aNumber, LPCSTR aPathString, BOOL aBoolean ))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpLoadModule: hProcess path: imageName moduleName: moduleName [
	"
This function returns the BaseOfDll value. required for many other operations ! 
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symloadmoduleex
DWORD64 IMAGEAPI SymLoadModuleEx(
  HANDLE        hProcess,
  HANDLE        hFile,
  PCSTR         ImageName,
  PCSTR         ModuleName,
  DWORD64       BaseOfDll,
  DWORD         DllSize,
  PMODLOAD_DATA Data,
  DWORD         Flags
);"

	^ self
		ffiCall:
			#(DWORD64 SymLoadModuleEx #(HANDLE hProcess, nil, LPCSTR imageName, LPCSTR moduleName, 0, 0, nil, 0))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpUnLoadModule: hProcess baseDll: baseDLL [ 
	"
The BaseOfDll is the loading point of the dll. 
This info can be obtained from the enumeration of the modules
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symunloadmodule
BOOL IMAGEAPI SymUnloadModule(
  HANDLE hProcess,
  DWORD  BaseOfDll
);"

	^ self
		ffiCall:
			#(BOOL SymUnloadModule #(HANDLE hProcess, DWORD baseDLL))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiEnumerateModules: hProcess  callback: aCallback [
	"
	https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symenumeratemodules64
BOOL IMAGEAPI SymEnumerateModules64(
  HANDLE                      hProcess,
  PSYM_ENUMMODULES_CALLBACK64 EnumModulesCallback,
  PVOID                       UserContext
);
"

	^ self
		ffiCall:
			#(BOOL SymEnumerateModules64 #(HANDLE hProcess, SYM_ENUMMODULES_CALLBACK64 aCallback , nil))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiEnumerateSymbols [
	"
IMAGEAPI SymEnumSymbols(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PCSTR                          Mask,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);
"
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiEnumerateSymbols: hProcess baseDll: baseDLL matching: aString callback: aCallback [
	"
BOOL IMAGEAPI SymEnumSymbols(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PCSTR                          Mask,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);
"

	^ self
		ffiCall:
			#(BOOL SymEnumSymbols #(HANDLE hProcess , ulonglong baseDLL , LPCSTR aString , SYM_ENUMERATESYMBOLS_CALLBACK aCallback , nil))
]

{ #category : #'reporting errors' }
DBGHelpLib >> initLibrary [
	self resetLibrary.
	(self
		ffiDBGHelpInitializeLibraryWithProcessHandle: self processHandle
		path: self defaultPath
		invasive: self defaultInvasive)
		ifFalse: [ self reportError: 0]
]

{ #category : #'reporting errors' }
DBGHelpLib >> inspectModule: aStringNameOrPath [
	
]

{ #category : #'reporting errors' }
DBGHelpLib >> loadModule: imageName [
	^ self loadModule: imageName moduleName: nil
]

{ #category : #'reporting errors' }
DBGHelpLib >> loadModule: imageName moduleName: moduleName [
	| ret |
	ret := self
		ffiDBGHelpLoadModule: self processHandle
		path: imageName
		moduleName: moduleName.
	self reportErrorIfZero: ret.
	^ ret
]

{ #category : #'reporting errors' }
DBGHelpLib >> processHandle [
	^ processHandle ifNil: [ processHandle := self defaultProcessHandle  ]
]

{ #category : #'reporting errors' }
DBGHelpLib >> resetLibrary [
	processHandle ifNotNil: [ self ffiDBGHelpCleanUp: processHandle ].
	processHandle := nil
]

{ #category : #'reporting errors' }
DBGHelpLib >> unloadModule: baseDLL [
	^ self ffiDBGHelpUnLoadModule: self processHandle baseDll: baseDLL
]

{ #category : #'reporting errors' }
DBGHelpLib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Dbghelp.dll'
]
