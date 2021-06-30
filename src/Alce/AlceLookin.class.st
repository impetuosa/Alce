Class {
	#name : #AlceLookIn,
	#superclass : #AlceLook,
	#instVars : [
		'context'
	],
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookIn >> lookInto: aNode [
	context := aNode. 
	^ aNode accept: self
]

{ #category : #testing }
AlceLookIn >> match: aNameReferenceNode with: anOtherString [ 
	 
	^ aNameReferenceNode referersTo: anOtherString
]

{ #category : #testing }
AlceLookIn >> matches: aString [
	^ self match: match with: aString
]

{ #category : #visiting }
AlceLookIn >> visitAccessModule: anAccessModule [

]

{ #category : #visiting }
AlceLookIn >> visitAlias: anAlcixAlias [

	anAlcixAlias type ifNotNil: [ anAlcixAlias type accept: self ]
]

{ #category : #visiting }
AlceLookIn >> visitAttributeAccessor: anAlcixAttributeAccessor [ 
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitClass: anAlcixClass [
	^ self visitModule: anAlcixClass
]

{ #category : #testing }
AlceLookIn >> visitCollection: aCollection [

	self hasFinding ifTrue: [ ^ self ].
	aCollection do: [ :a | 
		a accept: self.
		self hasFinding ifTrue: [ ^ self ] ]
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitEvent: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitForm: anAlcixForm [
	^ self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceLookIn >> visitFunction: aFunction [
	
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLibrary: anAlcixLibrary [

]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLocalVariable: anAlcixLocalVariable [ 

]

{ #category : #visiting }
AlceLookIn >> visitModule: aModule [

]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitParameter: anAlcixParameter [
	
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitReport: anAlcixReport [
	^ self visitForm: anAlcixReport
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]
