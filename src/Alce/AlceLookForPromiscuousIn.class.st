Class {
	#name : #AlceLookForPromiscuousIn,
	#superclass : #AlceLookForVariablesIn,
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> visitFunction: aFunction [

	(self matches: aFunction selector)
		ifTrue: [ self findings: aFunction ]
		ifFalse: [ super visitFunction: aFunction ]
]

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> visitModule: anAlcixModule [

	(self matches: anAlcixModule name)
		ifTrue: [ self findings: anAlcixModule ]
		ifFalse: [ super visitModule: anAlcixModule ]
]
