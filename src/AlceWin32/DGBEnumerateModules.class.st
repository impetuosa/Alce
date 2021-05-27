Class {
	#name : #DGBEnumerateModules,
	#superclass : #DGBCallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #AlceWin32
}

{ #category : #'instance creation' }
DGBEnumerateModules class >> fnSpec [
	^#(BOOL (PCTSTR  ModuleName, DWORD64 BaseOfDll,  void* userContext))
]
