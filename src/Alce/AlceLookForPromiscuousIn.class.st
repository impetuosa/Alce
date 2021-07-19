Class {
	#name : #AlceLookForPromiscuousIn,
	#superclass : #AlceLookForVariablesIn,
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> lookInto: aNode [

	| entities |
	entities := aNode mooseModel select: [ :a | self matches: a name ].
	entities size = 1 ifTrue: [ ^ self findings: entities first ].
	super lookInto: aNode
]

{ #category : #visiting }
AlceLookForPromiscuousIn >> visitExternalFunction: anAlcixExternalFunction [

	^ self visitFunction: anAlcixExternalFunction
]

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> visitFunction: aFunction [

	(self matches: aFunction selector)
		ifTrue: [ self findings: aFunction ]
		ifFalse: [ super visitFunction: aFunction ]
]

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> visitLibrary: aLibrary [

	(self matches: aLibrary name) ifTrue: [ ^ self findings: aLibrary ].
	aLibrary members do: [ :t | 
		(self matches: t name) ifTrue: [ ^ self findings: t ] ].
	aLibrary types do: [ :t | 
		(self matches: t name) ifTrue: [ ^ self findings: t ] ].
	aLibrary invocables do: [ :t | 
		(self matches: t selector) ifTrue: [ ^ self findings: t ] ]
]

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> visitModule: anAlcixModule [

	(self matches: anAlcixModule name)
		ifTrue: [ self findings: anAlcixModule ]
		ifFalse: [ super visitModule: anAlcixModule ]
]

{ #category : #visiting }
AlceLookForPromiscuousIn >> visitPrimitiveType: anAlcixPrimitiveType [ 


	(self matches: anAlcixPrimitiveType name)
		ifTrue: [ self findings: anAlcixPrimitiveType ]
		ifFalse: [  ]
]
