Class {
	#name : #AlcixAccessEntity,
	#superclass : #AlcixEntity,
	#instVars : [
		'#anchor => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessEntity class >> annotation [

	<FMClass: #AccessEntity super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessEntity >> accept: aVisitor [
	^ aVisitor visitAccessEntity: self

]

{ #category : #accessing }
AlcixAccessEntity >> anchor [

	<FMProperty: #anchor type: #Object>
	<generated>
	^ anchor
]

{ #category : #accessing }
AlcixAccessEntity >> anchor: anObject [
	<generated>
	anchor := anObject
]
