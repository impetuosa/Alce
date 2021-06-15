Class {
	#name : #AlceLookForVariablesIn,
	#superclass : #AlceLookIn,
	#instVars : [
		'onlyGlobals'
	],
	#category : #'Alce-Linker'
}

{ #category : #visiting }
AlceLookForVariablesIn >> initialize [
	super initialize.
	onlyGlobals := false
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitAccessModule: anAccessModule [
	onlyGlobals := true.
	self visitCollection: anAccessModule types.
	self visitCollection: anAccessModule references
]

{ #category : #visiting }
AlceLookForVariablesIn >> visitAttribute: anAttribute [
	((anAttribute visibility = #Public or: onlyGlobals) and: [ 
		 self matches: anAttribute name ]) ifTrue: [ 
		self findings: anAttribute ]
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
		(self matches: t name) ifTrue: [ ^ self findings: t ] ]
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
