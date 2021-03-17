Class {
	#name : #AlcixAttribute,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#accesses => FMMany type: #AlcixAccess opposite: #attribute',
		'#property => FMOne type: #AlcixProperty opposite: #attribute'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAttribute class >> annotation [

	<FMClass: #Attribute super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAttribute >> accesses [
	"Relation named: #accesses type: #AlcixAccess opposite: #attribute"

	<generated>
	<derived>
	^ accesses
]

{ #category : #accessing }
AlcixAttribute >> accesses: anObject [

	<generated>
	accesses value: anObject
]

{ #category : #adding }
AlcixAttribute >> addAccess: anObject [
	<generated>
	^ self accesses add: anObject
]

{ #category : #accessing }
AlcixAttribute >> property [
	"Relation named: #property type: #AlcixProperty opposite: #attribute"

	<generated>
	<derived>
	^ property
]

{ #category : #accessing }
AlcixAttribute >> property: anObject [

	<generated>
	property := anObject
]
