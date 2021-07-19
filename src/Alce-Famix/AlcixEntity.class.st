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

	self removeTags.
	aColor ifNil: [ ^ self ].
	self tagWith: (FamixTag tagFor: aColor model: self mooseModel)
]

{ #category : #accessing }
AlcixEntity >> colorIfAbsent: aBlock [

	^ self allTags
		  detect: [ :t | t name = #coloring ]
		  ifFound: [ :a | 
			  a color = Color transparent
				  ifTrue: [ aBlock value ]
				  ifFalse: [ a color ] ]
		  ifNone: [ aBlock value ]
]

{ #category : #accessing }
AlcixEntity >> includedColors [

	| colors |
	colors := OrderedCollection new.
	self includedColorsInto: colors.
	^ colors
]

{ #category : #accessing }
AlcixEntity >> isType [ 
	 ^ false 
]

{ #category : #accessing }
AlcixEntity >> name [

	^ self printString
]

{ #category : #query }
AlcixEntity >> query [

	^ MooseQuery receiver: self
]

{ #category : #'as yet unclassified' }
AlcixEntity >> threeWayCompareTo: anAlcixAttributeAccessor [

	^ self name threeWayCompareTo: anAlcixAttributeAccessor name
]

{ #category : #query }
AlcixEntity >> weight [

	^ 1
]
