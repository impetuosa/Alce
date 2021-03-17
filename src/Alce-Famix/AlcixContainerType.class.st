Class {
	#name : #AlcixContainerType,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#name => FMProperty',
		'#typedEntities => FMMany type: #AlcixTypedEntity opposite: #containerType'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixContainerType class >> annotation [

	<FMClass: #ContainerType super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixContainerType >> addTypedEntity: anObject [
	<generated>
	^ self typedEntities add: anObject
]

{ #category : #accessing }
AlcixContainerType >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixContainerType >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixContainerType >> typedEntities [
	"Relation named: #typedEntities type: #AlcixTypedEntity opposite: #containerType"

	<generated>
	<derived>
	^ typedEntities
]

{ #category : #accessing }
AlcixContainerType >> typedEntities: anObject [

	<generated>
	typedEntities value: anObject
]

{ #category : #navigation }
AlcixContainerType >> typedEntitiesGroup [
	<generated>
	<navigation: 'TypedEntities'>
	^ MooseSpecializedGroup withAll: self typedEntities asSet
]
