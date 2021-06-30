Class {
	#name : #AlceLookForFunctionOrSubIn,
	#superclass : #AlceLookIn,
	#instVars : [
		'onlyGlobals'
	],
	#category : #'Alce-Linker'
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
AlceLookForFunctionOrSubIn >> visitAlias: anAlcixAlias [

	anAlcixAlias type ifNotNil: [ anAlcixAlias type accept: self ]
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitClass: aClass [
	onlyGlobals ifFalse: [ self visitModule: aClass ]
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitEnum: anAlcixEnum [ 
	
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitExternalFunction: anAlcixExternalFunction [

	^ self visitFunction: anAlcixExternalFunction
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitFunction: aFunction [
	(self matches: aFunction selector) ifTrue: [ self findings: aFunction ]
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitLibrary: aLibrary [

	self visitCollection: aLibrary types.
	self visitCollection: aLibrary invocables.
	
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitModule: aModule [
	self visitCollection: aModule invocables.
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitPrimitiveType: anAlcixPrimitiveType [ 
	
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitStructure: anAlcixStructure [ 
	
]
