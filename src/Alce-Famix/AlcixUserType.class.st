Class {
	#name : #AlcixUserType,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#members => FMMany type: #AlcixAttribute opposite: #userType'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixUserType class >> annotation [

	<FMClass: #UserType super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixUserType >> accept: aVisitor [
	^ aVisitor visitUserType: self

]

{ #category : #adding }
AlcixUserType >> addMember: anObject [
	<generated>
	^ self members add: anObject
]

{ #category : #accessing }
AlcixUserType >> members [
	"Relation named: #members type: #AlcixAttribute opposite: #userType"

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
