Class {
	#name : #AlcixExternalSubProcedure,
	#superclass : #AlcixSubProcedure,
	#instVars : [
		'#alias => FMProperty',
		'#libraryName => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixExternalSubProcedure class >> annotation [

	<FMClass: #ExternalSubProcedure super: #AlcixSubProcedure>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixExternalSubProcedure >> accept: aVisitor [
	^ aVisitor visitExternalSubProcedure: self

]

{ #category : #accessing }
AlcixExternalSubProcedure >> alias [

	<FMProperty: #alias type: #String>
	<generated>
	^ alias
]

{ #category : #accessing }
AlcixExternalSubProcedure >> alias: anObject [
	<generated>
	alias := anObject
]

{ #category : #accessing }
AlcixExternalSubProcedure >> libraryName [

	<FMProperty: #libraryName type: #String>
	<generated>
	^ libraryName
]

{ #category : #accessing }
AlcixExternalSubProcedure >> libraryName: anObject [
	<generated>
	libraryName := anObject
]
