Class {
	#name : #AlceLookIn,
	#superclass : #AlceLook,
	#instVars : [
		'context',
		'symbols'
	],
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookIn class >> lookInto: anAlcixModule symbol: aCollection [

	^ self new
		  symbols: aCollection;
		  lookInto: anAlcixModule
]

{ #category : #'as yet unclassified' }
AlceLookIn >> lookInto: aNode [

	| newContext |
	context := aNode.
	symbols ifNil: [ ^ aNode accept: self ].


	((aNode isKindOf: AlcixFunction) and: [ 
		 aNode selector = symbols first name ]) ifTrue: [ 
		^ self findings:
			  (aNode localVariables detect: [ :v | v name = aNode selector ]) ].

	match := self firstMatchingSymbol.

	[ context parent isNil ] whileFalse: [ context := context parent ].

	match owner type = JinLibrary ifTrue: [ 
		newContext := context references detect: [ :r | 
			              r name = match owner name ] ].

	match kind isParameter ifTrue: [ 
		^ self findings:
			  (aNode parameters detect: [ :p | p name = match name ]) ].

	({ 
		 JinModule.
		 JinReport.
		 JinForm.
		 JinTable.
		 JinQuery } includes: match owner type) ifTrue: [ 
		newContext := context types detect: [ :r | 
			              r name = match owner simpleName ] ].

	newContext accept: self
]

{ #category : #testing }
AlceLookIn >> match: aNameReferenceNode with: anOtherString [ 
	 
	^ aNameReferenceNode referersTo: anOtherString
]

{ #category : #testing }
AlceLookIn >> matches: aString [
	^ self match: match with: aString
]

{ #category : #accessing }
AlceLookIn >> symbols: aCollection [ 
	symbols := aCollection
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
