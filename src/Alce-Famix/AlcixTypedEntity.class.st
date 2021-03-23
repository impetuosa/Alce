Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
	#instVars : [
		'#name => FMProperty',
		'#userType => FMOne type: #AlcixUserType opposite: #members'
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
AlcixTypedEntity >> userType [
	"Relation named: #userType type: #AlcixUserType opposite: #members"

	<generated>
	<container>
	^ userType
]

{ #category : #accessing }
AlcixTypedEntity >> userType: anObject [

	<generated>
	userType := anObject
]

{ #category : #navigation }
AlcixTypedEntity >> userTypeGroup [
	<generated>
	<navigation: 'UserType'>
	^ MooseSpecializedGroup with: self userType
]
