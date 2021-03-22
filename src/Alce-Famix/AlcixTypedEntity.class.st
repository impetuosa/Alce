Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#containerType => FMOne type: #AlcixContainerType opposite: #typedEntities',
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
AlcixTypedEntity >> containerType [
	"Relation named: #containerType type: #AlcixContainerType opposite: #typedEntities"

	<generated>
	<container>
	^ containerType
]

{ #category : #accessing }
AlcixTypedEntity >> containerType: anObject [

	<generated>
	containerType := anObject
]

{ #category : #navigation }
AlcixTypedEntity >> containerTypeGroup [
	<generated>
	<navigation: 'ContainerType'>
	^ MooseSpecializedGroup with: self containerType
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
