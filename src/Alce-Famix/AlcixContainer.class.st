Class {
	#name : #AlcixContainer,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#name => FMProperty',
		'#types => FMMany type: #AlcixTType opposite: #container'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixContainer class >> annotation [

	<FMClass: #Container super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixContainer >> addType: anObject [
	<generated>
	^ self types add: anObject
]

{ #category : #accessing }
AlcixContainer >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixContainer >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixContainer >> types [
	"Relation named: #types type: #AlcixTType opposite: #container"

	<generated>
	<derived>
	^ types
]

{ #category : #accessing }
AlcixContainer >> types: anObject [

	<generated>
	types value: anObject
]

{ #category : #navigation }
AlcixContainer >> typesGroup [
	<generated>
	<navigation: 'Types'>
	^ MooseSpecializedGroup withAll: self types asSet
]
