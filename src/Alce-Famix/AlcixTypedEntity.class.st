Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#module => FMOne type: #AlcixModule opposite: #members',
		'#name => FMProperty',
		'#type => FMOne type: #AlcixTType opposite: #typedEntity'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTypedEntity class >> annotation [

	<FMClass: #TypedEntity super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixTypedEntity >> module [
	"Relation named: #module type: #AlcixModule opposite: #members"

	<generated>
	<container>
	^ module
]

{ #category : #accessing }
AlcixTypedEntity >> module: anObject [

	<generated>
	module := anObject
]

{ #category : #navigation }
AlcixTypedEntity >> moduleGroup [
	<generated>
	<navigation: 'Module'>
	^ MooseSpecializedGroup with: self module
]

{ #category : #accessing }
AlcixTypedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixTypedEntity >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixTypedEntity >> type [
	"Relation named: #type type: #AlcixTType opposite: #typedEntity"

	<generated>
	^ type
]

{ #category : #accessing }
AlcixTypedEntity >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
AlcixTypedEntity >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
