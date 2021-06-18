Class {
	#name : #AlcixExternalFunction,
	#superclass : #AlcixFunction,
	#instVars : [
		'libraryName',
		'alias'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixExternalFunction class >> annotation [

	<FMClass: #ExternalFunction super: #AlcixFunction>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixExternalFunction >> accept: aVisitor [
	^ aVisitor visitExternalFunction: self

]

{ #category : #visiting }
AlcixExternalFunction >> alias [

	<FMProperty: #alias type: #String>
	<generated>
	^ alias
]

{ #category : #visiting }
AlcixExternalFunction >> alias: aName [

	^ alias := aName
]

{ #category : #visiting }
AlcixExternalFunction >> libraryName [

	<FMProperty: #libraryName type: #String>
	<generated>
	^ libraryName
]

{ #category : #visiting }
AlcixExternalFunction >> libraryName: aName [

	^ libraryName := aName
]
