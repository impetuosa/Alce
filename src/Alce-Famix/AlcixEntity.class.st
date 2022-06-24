Class {
	#name : #AlcixEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'color'
	],
	#classInstVars : [
		'color'
	],
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

{ #category : #visiting }
AlcixEntity >> acceptVisitor: aMOAlceModelReader [

	^ self accept: aMOAlceModelReader
]

{ #category : #testing }
AlcixEntity >> color [

	^ self allTagAssociations
		  ifEmpty: [ Color transparent ]
		  ifNotEmpty: [ :a | a first tag color  ]
]

{ #category : #accessing }
AlcixEntity >> color: aColor [

	| t |
	t := self allTagAssociations
		     ifEmpty: [ 
			     | assoc |
			     aColor ifNil: [ ^ self ].
			     assoc := mooseModel instantiate: FamixTagAssociation.
			     assoc setEntityTo: self.
			     assoc tag: (mooseModel instantiate: FamixTag).
			     assoc tag name: 'Color'.
			     assoc tag color: aColor ]
		     ifNotEmpty: [ :assocs | 
			     aColor ifNil: [ assocs first remove ] ifNotNil: [ 
				     assocs first tag name: 'Color'.
				     assocs first tag color: aColor ] ]
]

{ #category : #testing }
AlcixEntity >> entryName [
	^ self name 
]

{ #category : #testing }
AlcixEntity >> isAccessModule [
	^ false 
]

{ #category : #testing }
AlcixEntity >> isAssignment [

	<generated>
	^ false
]

{ #category : #testing }
AlcixEntity >> isLocalVariable [
	 ^ false 
]

{ #category : #testing }
AlcixEntity >> isParameter [

	^ false
]

{ #category : #testing }
AlcixEntity >> isType [

	^ false
]

{ #category : #testing }
AlcixEntity >> isUndefined [
	 ^ false. 
]

{ #category : #testing }
AlcixEntity >> isUnknown [ 
	 ^ false. 
]

{ #category : #testing }
AlcixEntity >> isUnknownOrUndefined [

	^ self isUnknown or: [ self isUndefined ]
]
