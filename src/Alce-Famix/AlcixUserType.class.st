Class {
	#name : #AlcixUserType,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType + AlcixTWithConstants',
	#classTraits : 'AlcixTType classTrait + AlcixTWithConstants classTrait',
	#instVars : [
		'#invocables => FMMany type: #AlcixInvocable opposite: #userType',
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
AlcixUserType >> addInvocable: anObject [
	<generated>
	^ self invocables add: anObject
]

{ #category : #adding }
AlcixUserType >> addMember: anObject [
	<generated>
	^ self members add: anObject
]

{ #category : #accessing }
AlcixUserType >> invocables [
	"Relation named: #invocables type: #AlcixInvocable opposite: #userType"

	<generated>
	<derived>
	^ invocables
]

{ #category : #accessing }
AlcixUserType >> invocables: anObject [

	<generated>
	invocables value: anObject
]

{ #category : #navigation }
AlcixUserType >> invocablesGroup [
	<generated>
	<navigation: 'Invocables'>
	^ MooseSpecializedGroup withAll: self invocables asSet
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

{ #category : #accessing }
AlcixUserType >> printOn: aStream [

	aStream
		nextPutAll: (self className copyFrom: 6 to: self className size);
		nextPutAll: ':';
		nextPutAll: name
]
