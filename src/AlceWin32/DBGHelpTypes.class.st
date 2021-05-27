Class {
	#name : #DBGHelpTypes,
	#superclass : #SharedPool,
	#classVars : [
		'DWORD64',
		'SYMBOLINFO',
		'SYM_ENUMERATESYMBOLS_CALLBACK'
	],
	#pools : [
		'Win32Types'
	],
	#category : #AlceWin32
}

{ #category : #'class initialization' }
DBGHelpTypes class >> initialize [
	DWORD64 := #ulonglong.
	SYMBOLINFO := #DBGSymbolInfo.
	SYM_ENUMERATESYMBOLS_CALLBACK := #DGBEnumerateSymbols.
]
