Class {
	#name : #AlcixInvocable,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#selector => FMProperty',
		'#visibility => FMProperty',
		'#parameters => FMMany type: #AlcixParameter opposite: #invocable',
		'#accesses => FMMany type: #AlcixAccess opposite: #invocable',
		'#localVariables => FMMany type: #AlcixLocalVariable opposite: #invocable',
		'#outgoingInvocations => FMMany type: #AlcixInvocation opposite: #sender',
		'#incomingInvocations => FMMany type: #AlcixInvocation opposite: #candidate',
		'#userType => FMOne type: #AlcixUserType opposite: #invocables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocable class >> annotation [

	<FMClass: #Invocable super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixInvocable >> accept: aVisitor [
	^ aVisitor visitInvocable: self

]

{ #category : #accessing }
AlcixInvocable >> accesses [
	"Relation named: #accesses type: #AlcixAccess opposite: #invocable"

	<generated>
	<derived>
	^ accesses
]

{ #category : #accessing }
AlcixInvocable >> accesses: anObject [

	<generated>
	accesses value: anObject
]

{ #category : #navigation }
AlcixInvocable >> accessesGroup [
	<generated>
	<navigation: 'Accesses'>
	^ MooseSpecializedGroup withAll: self accesses asSet
]

{ #category : #adding }
AlcixInvocable >> addAccess: anObject [
	<generated>
	^ self accesses add: anObject
]

{ #category : #adding }
AlcixInvocable >> addIncomingInvocation: anObject [
	<generated>
	^ self incomingInvocations add: anObject
]

{ #category : #adding }
AlcixInvocable >> addLocalVariable: anObject [
	<generated>
	^ self localVariables add: anObject
]

{ #category : #adding }
AlcixInvocable >> addOutgoingInvocation: anObject [
	<generated>
	^ self outgoingInvocations add: anObject
]

{ #category : #adding }
AlcixInvocable >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #adding }
AlcixInvocable >> color [

	^ userType ifNil: [ Color transparent ] ifNotNil: [ userType color ]
]

{ #category : #accessing }
AlcixInvocable >> incomingInvocations [
	"Relation named: #incomingInvocations type: #AlcixInvocation opposite: #candidate"

	<generated>
	<derived>
	^ incomingInvocations
]

{ #category : #accessing }
AlcixInvocable >> incomingInvocations: anObject [

	<generated>
	incomingInvocations value: anObject
]

{ #category : #navigation }
AlcixInvocable >> incomingInvocationsGroup [
	<generated>
	<navigation: 'IncomingInvocations'>
	^ MooseSpecializedGroup withAll: self incomingInvocations asSet
]

{ #category : #testing }
AlcixInvocable >> isMethod [
	^ self userType isAlcixClass 
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
AlcixInvocable >> name [ 
	 ^ selector 
]

{ #category : #accessing }
AlcixInvocable >> outgoingInvocations [
	"Relation named: #outgoingInvocations type: #AlcixInvocation opposite: #sender"

	<generated>
	<derived>
	^ outgoingInvocations
]

{ #category : #accessing }
AlcixInvocable >> outgoingInvocations: anObject [

	<generated>
	outgoingInvocations value: anObject
]

{ #category : #navigation }
AlcixInvocable >> outgoingInvocationsGroup [
	<generated>
	<navigation: 'OutgoingInvocations'>
	^ MooseSpecializedGroup withAll: self outgoingInvocations asSet
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
AlcixInvocable >> parent [

	^ userType
]

{ #category : #accessing }
AlcixInvocable >> printOn: aStream [

	aStream
		nextPutAll: (self class name copyFrom: 6 to: self class name size);
		space;
		nextPutAll: selector;
		nextPutAll: '(#';
		nextPutAll:
			(parameters ifNil: [ '0' ] ifNotNil: [ parameters size asString ]);
		nextPutAll: ')'
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

{ #category : #accessing }
AlcixInvocable >> visibility [

	<FMProperty: #visibility type: #String>
	<generated>
	^ visibility
]

{ #category : #accessing }
AlcixInvocable >> visibility: anObject [
	<generated>
	visibility := anObject
]

{ #category : #accessing }
AlcixInvocable >> weight [

	^ parameters size 
	  + (outgoingInvocations collect: [ :a | a weight ]) sum
	  + (localVariables collect: [ :a | a weight ]) sum
	  + (accesses collect: [ :a | a weight ]) sum
]
