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
	^ false 
]

{ #category : #'reporting errors' }
DBGHelpLib >> defaultPath [
	^ nil
]

{ #category : #'reporting errors' }
DBGHelpLib >> defaultProcessHandle [
	^ 90480 + ((Random seed: DateAndTime now asUnixTime) nextInt: 4000) 
]

{ #category : #'reporting errors' }
DBGHelpLib >> enumerateSymbols: baseDLL callback: aCallback [
	^ self
		ffiEnumerateSymbols: self processHandle
		baseDll: baseDLL
		callback: (DGBEnumerateSymbols on: aCallback)
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpCleanUp: processHandleNumber [
	"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symcleanup
BOOL IMAGEAPI SymCleanup(
  HANDLE hProcess
);"

	^ self ffiCall: #(BOOL SymCleanup #(ulong processHandleNumber))
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
	^ self ffiCall: #(BOOL SymInitialize #(ulong aNumber, LPCSTR aPathString, BOOL aBoolean ))
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
			#(DWORD64 SymLoadModuleEx #(ulong hProcess, nil, LPCSTR imageName, LPCSTR moduleName, 0, 0, nil, 0))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpUnLoadModule: hProcess path: baseDLL [ 
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
			#(BOOL SymUnloadModule #(ulong hProcess, DWORD baseDLL))
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
DBGHelpLib >> ffiEnumerateSymbols: hProcess baseDll: baseDLL callback: aCallback [
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
			#(BOOL SymEnumSymbols #(ulong hProcess , DWORD64 baseDLL , nil , SYM_ENUMERATESYMBOLS_CALLBACK aCallback , nil))
]

{ #category : #'reporting errors' }
DBGHelpLib >> initLibrary [
	self resetLibrary.
	(self
		ffiDBGHelpInitializeLibraryWithProcessHandle: self processHandle
		path: self defaultPath
		invasive: self defaultInvasive)
		ifFalse: [ self error: 'Error  on library initialization! ' ]
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
DBGHelpLib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Dbghelp.dll'
]
