Class {
	#name : #AlceLookForVariablesIn,
	#superclass : #AlceLookIn,
	#instVars : [
		'onlyGlobals'
	],
	#category : #'Alce-Linker'
}

{ #category : #visiting }
AlceLookForVariablesIn >> firstMatchingSymbol [
	| ms |
	ms := (symbols select: [ :s | s kind isAttribute ]).
	ms ifEmpty: [ ms := symbols ].
	^  ms first
]

{ #category : #visiting }
AlceLookForVariablesIn >> initialize [
	super initialize.
	onlyGlobals := false
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitAccessModule: anAccessModule [
	onlyGlobals := true.
	self visitCollection: anAccessModule types.
	self visitCollection: anAccessModule allReferences
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitAttribute: anAttribute [
	((anAttribute visibility = #Public or: onlyGlobals not) and: [ 
		 self matches: anAttribute name ]) ifTrue: [ 
		self findings: anAttribute ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitEnum: anAlcixEnum [

	self visitCollection: anAlcixEnum enumValues
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitEnumValue: anAlcixEnumValue [

	(self matches: anAlcixEnumValue name) ifTrue: [ 
		self findings: anAlcixEnumValue ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitFunction: aFunction [
	self visitCollection: aFunction parameters.
	self visitCollection: aFunction localVariables.
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitGlobalVariable: anAlcixGlobalVariable [
	(self matches: anAlcixGlobalVariable name) ifTrue: [ 
		self findings: anAlcixGlobalVariable ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitLibrary: aLibrary [
	aLibrary members do: [ :t | 
		(self matches: t name) ifTrue: [ ^ self findings: t ] ].
	aLibrary types do: [ :t | 
		t accept: self ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitLocalVariable: anAlcixLocalVariable [
	(onlyGlobals not and: [ self matches: anAlcixLocalVariable name ]) 
		ifTrue: [ self findings: anAlcixLocalVariable ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitModule: aModule [
	self visitCollection: aModule members
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitParameter: anAlcixParameter [
	(onlyGlobals not and: [ self matches: anAlcixParameter name ]) 
		ifTrue: [ self findings: anAlcixParameter ]
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitPrimitiveType: anAlcixPrimitiveType [ 

]

{ #category : #visiting }
AlceLookForVariablesIn >> visitStructure: anAlcixStructure [ 

]
