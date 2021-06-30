Class {
	#name : #AlcixEntity,
	#superclass : #MooseEntity,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #meta }
AlcixEntity class >> entryName [

	^ self name copyReplaceAll: 'Alcix' with: ''
]

{ #category : #meta }
AlcixEntity class >> metamodel [

	<generated>
	^ AlcixModel metamodel
]

{ #category : #accessing }
AlcixEntity >> color [

	^ self colorIfAbsent: [ Color transparent ]
]

{ #category : #accessing }
AlcixEntity >> color: aColor [

	self attributeAt: #Color put: aColor
]

{ #category : #accessing }
AlcixEntity >> colorIfAbsent: aBlock [
	| val |
	val := self attributeAt: #Color ifAbsent: [ nil ].
	^ val ifNil: [ aBlock value  ]
]

{ #category : #'as yet unclassified' }
AlcixEntity >> colorOrPopularColor [

	| color |
	color := self color.
	^ color = Color transparent
		  ifTrue: [ self popularColor ]
		  ifFalse: [ color ]
]

{ #category : #accessing }
AlcixEntity >> includedColors [

	| colors |
	colors := OrderedCollection new.
	self includedColorsInto: colors.
	^ colors
]

{ #category : #accessing }
AlcixEntity >> includedColorsInto: colors [

	
]

{ #category : #'as yet unclassified' }
AlcixEntity >> popularColor [

	| colors |
	colors := self includedColors reject: [ :c | c = Color transparent ].
	colors := (colors groupedBy: #yourself) associations sort: [ :a :b | 
		          a value size > b value size ].
	^ colors ifEmpty: [ self color ] ifNotEmpty: [ colors first key ]
]
