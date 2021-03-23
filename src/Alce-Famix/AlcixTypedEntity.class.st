Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixTTyped,
	#instVars : [
		'#module => FMOne type: #AlcixModule opposite: #members',
		'#name => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTypedEntity class >> annotation [

	<FMClass: #TypedEntity super: #AlcixTTyped>
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
