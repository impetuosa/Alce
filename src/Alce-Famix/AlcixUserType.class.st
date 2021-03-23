Class {
	#name : #AlcixUserType,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#members => FMMany type: #AlcixTypedEntity opposite: #userType'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixUserType class >> annotation [

	<FMClass: #UserType super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixUserType >> addMember: anObject [
	<generated>
	^ self members add: anObject
]

{ #category : #accessing }
AlcixUserType >> members [
	"Relation named: #members type: #AlcixTypedEntity opposite: #userType"

	<generated>
	<derived>
	^ members
]

{ #category : #accessing }
AlcixUserType >> members: anObject [

	<generated>
	members value: anObject
]

{ #category : #navigation }
AlcixUserType >> membersGroup [
	<generated>
	<navigation: 'Members'>
	^ MooseSpecializedGroup withAll: self members asSet
]
