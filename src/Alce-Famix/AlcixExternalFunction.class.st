Class {
	#name : #AlcixExternalFunction,
	#superclass : #AlcixFunction,
	#instVars : [
		'#alias => FMProperty',
		'#libraryName => FMProperty'
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
AlcixExternalFunction >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessExternalFunction: self

]

{ #category : #accessing }
AlcixExternalFunction >> alias [

	<FMProperty: #alias type: #String>
	<generated>
	^ alias
]

{ #category : #accessing }
AlcixExternalFunction >> alias: anObject [
	<generated>
	alias := anObject
]

{ #category : #accessing }
AlcixExternalFunction >> libraryName [

	<FMProperty: #libraryName type: #String>
	<generated>
	^ libraryName
]

{ #category : #accessing }
AlcixExternalFunction >> libraryName: anObject [
	<generated>
	libraryName := anObject
]
