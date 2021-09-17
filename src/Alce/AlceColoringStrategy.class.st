Class {
	#name : #AlceColoringStrategy,
	#superclass : #Object,
	#instVars : [
		'visited',
		'colors',
		'selectingCategory'
	],
	#category : #'Alce-Coloring'
}

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> askForAcceptTo: anAlcixAttribute [

	(visited includes: anAlcixAttribute) ifFalse: [ 
		visited add: anAlcixAttribute.
		anAlcixAttribute accept: self ]
]

{ #category : #initialization }
AlceColoringStrategy >> colorsFor: anEntity [

	anEntity ifNil: [ ^ {  } ].
	self askForAcceptTo: anEntity.


	^ colors at: anEntity
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> colorsForAll: aCollection [

	^ aCollection flatCollect: [ :a | self colorsFor: a ]
]

{ #category : #initialization }
AlceColoringStrategy >> initialize [

	super initialize.
	visited := OrderedCollection new.
	colors := Dictionary new
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> selectingCategory: aSc [

	selectingCategory := aSc
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> tagsFor: anAlcixPrimitiveType [

	^ anAlcixPrimitiveType tags select: [ :t | 
		  t categories includes: self selectingCategory ]
]
