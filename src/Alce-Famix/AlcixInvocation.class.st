Class {
	#name : #AlcixInvocation,
	#superclass : #AlcixAccessEntity,
	#traits : 'TAlceInvocation',
	#classTraits : 'TAlceInvocation classTrait',
	#instVars : [
		'#selector => FMProperty',
		'#invocable => FMOne type: #AlcixInvocable opposite: #outgoingInvocations',
		'#candidates => FMMany type: #AlcixInvocable opposite: #invocation',
		'#arguments => FMMany type: #AlcixArgument opposite: #invocation'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocation class >> annotation [

	<FMClass: #Invocation super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixInvocation >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #adding }
AlcixInvocation >> addCandidate: anObject [
	<generated>
	^ self candidates add: anObject
]

{ #category : #accessing }
AlcixInvocation >> arguments [
	"Relation named: #arguments type: #AlcixArgument opposite: #invocation"

	<generated>
	<derived>
	^ arguments
]

{ #category : #accessing }
AlcixInvocation >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : #navigation }
AlcixInvocation >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseSpecializedGroup withAll: self arguments asSet
]

{ #category : #accessing }
AlcixInvocation >> candidates [
	"Relation named: #candidates type: #AlcixInvocable opposite: #invocation"

	<generated>
	<derived>
	^ candidates
]

{ #category : #accessing }
AlcixInvocation >> candidates: anObject [

	<generated>
	candidates value: anObject
]

{ #category : #navigation }
AlcixInvocation >> candidatesGroup [
	<generated>
	<navigation: 'Candidates'>
	^ MooseSpecializedGroup withAll: self candidates asSet
]

{ #category : #accessing }
AlcixInvocation >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #outgoingInvocations"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixInvocation >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixInvocation >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #accessing }
AlcixInvocation >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll:'::'; 
		nextPutAll: selector;
		nextPutAll: '(a:#';
		nextPutAll: arguments size asString;
		nextPutAll: ')'
]

{ #category : #accessing }
AlcixInvocation >> selector [

	<FMProperty: #selector type: #String>
	<generated>
	^ selector
]

{ #category : #accessing }
AlcixInvocation >> selector: anObject [
	<generated>
	selector := anObject
]
