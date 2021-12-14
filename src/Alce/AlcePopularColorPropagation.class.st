Class {
	#name : #AlcePopularColorPropagation,
	#superclass : #AlceColoringStrategy,
	#instVars : [
		'realStrategy'
	],
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlcePopularColorPropagation >> colorFor: anAlcixAttribute [

	^ self colorsFor: anAlcixAttribute
]

{ #category : #initialization }
AlcePopularColorPropagation >> colorsFor: anEntity [

	anEntity ifNil: [ ^ {  } ].
	realStrategy ifNil: [ ^ {  } ].
	[ 
	^ colors at: anEntity ifAbsentPut: [ 
		  self
			  mostPopularOfAll: (realStrategy colorsFor: anEntity)
			  ifNone: [ Color transparent ] ] ]
		on: Error
		do: [ :e | 
			self haltOnce. 
			realStrategy visited removeKey: anEntity.
 ]
]

{ #category : #initialization }
AlcePopularColorPropagation >> mostPopular [

	^ self
]

{ #category : #initialization }
AlcePopularColorPropagation >> mostPopularOfAll: aCollection [

	self mostPopularOfAll: aCollection ifNone: [  self error: 'Collection is empty' ]
]

{ #category : #initialization }
AlcePopularColorPropagation >> mostPopularOfAll: aCollection ifNone: aBlock [

	| tags |
	tags := (aCollection groupedBy: #yourself) associations sort: [ :a :b | 
		        a value size > b value size ].
	^ tags
		  ifEmpty: [ aBlock value ]
		  ifNotEmpty: [ tags first key tag color ]
]

{ #category : #initialization }
AlcePopularColorPropagation >> realStrategy: aStrategy [

	realStrategy := aStrategy
]
