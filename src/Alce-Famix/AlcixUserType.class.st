Class {
	#name : #AlcixUserType,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#members => FMMany type: #AlcixAttribute opposite: #userType',
		'#invocables => FMMany type: #AlcixInvocable opposite: #userType'
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

{ #category : #converting }
AlcixUserType >> asType [
	^ self 
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

{ #category : #adding }
AlcixUserType >> isAlcixClass [
	^ false
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

{ #category : #navigation }
AlcixUserType >> printOn: aStream [

	aStream
		nextPutAll: (self class name copyReplaceAll: 'Alcix' with: '');
		nextPutAll: '(';
		nextPutAll: name;
		nextPutAll: ')'
]

{ #category : #generated }
AlcixUserType >> type [
	^ self 
]

{ #category : #accessing }
AlcixUserType >> types [

	^ {  }
]

{ #category : #accessing }
AlcixUserType >> userType [
	^ self 
]

{ #category : #accessing }
AlcixUserType >> weight [

	^ (members collect: [ :m | m weight ]) sum
	  + (invocables collect: [ :m | m weight ]) sum
]
