Class {
	#name : #DGBEnumerateSymbols,
	#superclass : #DGBCallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #AlceWin32
}

{ #category : #'instance creation' }
DGBEnumerateSymbols class >> fnSpec [
	^#(BOOL (SYMBOLINFO* pSymInfo, ulong symbolSize, void* userContext))
]
