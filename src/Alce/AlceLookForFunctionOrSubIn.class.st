Class {
	#name : #AlceLookForFunctionOrSubIn,
	#superclass : #AlceLookIn,
	#instVars : [
		'onlyGlobals'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> initialize [ 
	super initialize.
	onlyGlobals := false.
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitAccessModule: anAccessModule [
	onlyGlobals := true.
	self visitCollection: anAccessModule types.
	self visitCollection: anAccessModule references
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitClass: aClass [
	onlyGlobals ifFalse: [ self visitModule: aClass ]
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitFunction: aFunction [
	(self matches: aFunction selector) ifTrue: [ self findings: aFunction ]
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitModule: aModule [
	self visitCollection: aModule invocables.
]
