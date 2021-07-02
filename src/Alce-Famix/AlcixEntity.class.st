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

{ #category : #accessing }
AlcixEntity >> includedColors [

	| colors |
	colors := OrderedCollection new.
	self includedColorsInto: colors.
	^ colors
]
