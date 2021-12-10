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

	(visited includesKey: anAlcixAttribute) ifFalse: [ 
		visited at: anAlcixAttribute put: true .
		[anAlcixAttribute accept: self] on: Error do: [ colors at: anAlcixAttribute put: OrderedCollection new ] ]
]

{ #category : #initialization }
AlceColoringStrategy >> colorsFor: anEntity [

	anEntity ifNil: [ ^ {  } ].
	self askForAcceptTo: anEntity.


	^ (colors at: anEntity) collect: [ :a | 
		  AlceTagAssociationWrapDueTo new
			  wrapped: a;
			  dueTo: anEntity;
			  yourself ]
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> colorsFor: anAlcixClass collection: aFullBlockClosure [

	colors at: anAlcixClass ifAbsent: [ 
		colors at: anAlcixClass put: OrderedCollection new.
		aFullBlockClosure value: (colors at: anAlcixClass) ]
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> colorsForAll: aCollection [

	^ aCollection flatCollect: [ :a | 
		  self colorsFor: a ]
]

{ #category : #initialization }
AlceColoringStrategy >> initialize [

	super initialize.
	visited := Dictionary new.
	colors := Dictionary new
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> mostPopular [

	^ AlcePopularColorPropagation new
		  realStrategy: self;
		  yourself
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> reset [

	visited := Dictionary new.
	colors := Dictionary new
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> selectingCategory [

	^ selectingCategory
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> selectingCategory: aSc [

	selectingCategory := aSc
]

{ #category : #'as yet unclassified' }
AlceColoringStrategy >> tagAssociationsFor: anAlcixPrimitiveType [

	| cl |
	cl := anAlcixPrimitiveType tagAssociations select: [ :t | 
		      t tag categories includes: self selectingCategory ].

	^ cl
]
