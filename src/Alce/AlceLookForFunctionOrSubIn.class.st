Class {
	#name : #AlceLookForFunctionOrSubIn,
	#superclass : #AlceLookIn,
	#instVars : [
		'onlyGlobals'
	],
	#category : #'Alce-Linker'
}

{ #category : #accessing }
AlceLookForFunctionOrSubIn >> firstMatchingSymbol [

	^ (symbols select: [ :s | s kind isInvocable ]) first
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> initialize [ 
	super initialize.
	onlyGlobals := false.
]

{ #category : #visiting }
AlceLookForFunctionOrSubIn >> visitAccessModule: anAccessModule [
	onlyGlobals := true.
	self visitCollection: anAccessModule types.
	self visitCollection: anAccessModule allReferences
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
