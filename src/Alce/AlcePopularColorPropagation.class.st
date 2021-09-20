Class {
	#name : #AlcePopularColorPropagation,
	#superclass : #AlceColoringStrategy,
	#instVars : [
		'realStrategy'
	],
	#category : #'Alce-Coloring'
}

{ #category : #initialization }
AlcePopularColorPropagation >> colorsFor: anEntity [

	anEntity ifNil: [ ^ {  } ].



	^ colors
		  at: anEntity
		  ifAbsentPut: [ 
		  self mostPopularOfAll: (realStrategy colorsFor: anEntity) ]
]

{ #category : #initialization }
AlcePopularColorPropagation >> mostPopularOfAll: aCollection [

	^ ((aCollection groupedBy: #yourself) associations sort:
		   #size descending) first key
]
