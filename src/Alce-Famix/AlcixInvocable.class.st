Class {
	#name : #AlcixInvocable,
	#superclass : #AlcixWithAccesses,
	#traits : 'AlcixTWithConstants',
	#classTraits : 'AlcixTWithConstants classTrait',
	#instVars : [
		'#localVariables => FMMany type: #AlcixLocalVariable opposite: #invocable',
		'#parameters => FMMany type: #AlcixParameter opposite: #invocable',
		'#selector => FMProperty',
		'#userType => FMOne type: #AlcixUserType opposite: #invocables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocable class >> annotation [

	<FMClass: #Invocable super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixInvocable >> accept: aVisitor [
	^ aVisitor visitInvocable: self

]

{ #category : #adding }
AlcixInvocable >> addLocalVariable: anObject [
	<generated>
	^ self localVariables add: anObject
]

{ #category : #adding }
AlcixInvocable >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
AlcixInvocable >> localVariables [
	"Relation named: #localVariables type: #AlcixLocalVariable opposite: #invocable"

	<generated>
	<derived>
	^ localVariables
]

{ #category : #accessing }
AlcixInvocable >> localVariables: anObject [

	<generated>
	localVariables value: anObject
]

{ #category : #navigation }
AlcixInvocable >> localVariablesGroup [
	<generated>
	<navigation: 'LocalVariables'>
	^ MooseSpecializedGroup withAll: self localVariables asSet
]

{ #category : #accessing }
AlcixInvocable >> parameters [
	"Relation named: #parameters type: #AlcixParameter opposite: #invocable"

	<generated>
	<derived>
	^ parameters
]

{ #category : #accessing }
AlcixInvocable >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #navigation }
AlcixInvocable >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseSpecializedGroup withAll: self parameters asSet
]

{ #category : #accessing }
AlcixInvocable >> selector [

	<FMProperty: #selector type: #String>
	<generated>
	^ selector
]

{ #category : #accessing }
AlcixInvocable >> selector: anObject [
	<generated>
	selector := anObject
]

{ #category : #accessing }
AlcixInvocable >> userType [
	"Relation named: #userType type: #AlcixUserType opposite: #invocables"

	<generated>
	<container>
	^ userType
]

{ #category : #accessing }
AlcixInvocable >> userType: anObject [

	<generated>
	userType := anObject
]

{ #category : #navigation }
AlcixInvocable >> userTypeGroup [
	<generated>
	<navigation: 'UserType'>
	^ MooseSpecializedGroup with: self userType
]
