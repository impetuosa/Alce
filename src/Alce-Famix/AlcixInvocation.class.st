Class {
	#name : #AlcixInvocation,
	#superclass : #AlcixAccess,
	#instVars : [
		'#selector => FMProperty',
		'#sender => FMOne type: #AlcixInvocable opposite: #outgoingInvocations',
		'#candidate => FMOne type: #AlcixInvocable opposite: #incomingInvocations',
		'#arguments => FMMany type: #AlcixArgument opposite: #invocation'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocation class >> annotation [

	<FMClass: #Invocation super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixInvocation >> accept: aVisitor [
	^ aVisitor visitInvocation: self

]

{ #category : #adding }
AlcixInvocation >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
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
AlcixInvocation >> candidate [
	"Relation named: #candidate type: #AlcixInvocable opposite: #incomingInvocations"

	<generated>
	<container>
	^ candidate
]

{ #category : #accessing }
AlcixInvocation >> candidate: anObject [

	<generated>
	candidate := anObject
]

{ #category : #navigation }
AlcixInvocation >> candidateGroup [
	<generated>
	<navigation: 'Candidate'>
	^ MooseSpecializedGroup with: self candidate
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

{ #category : #accessing }
AlcixInvocation >> sender [
	"Relation named: #sender type: #AlcixInvocable opposite: #outgoingInvocations"

	<generated>
	<container>
	^ sender
]

{ #category : #accessing }
AlcixInvocation >> sender: anObject [

	<generated>
	sender := anObject
]

{ #category : #navigation }
AlcixInvocation >> senderGroup [
	<generated>
	<navigation: 'Sender'>
	^ MooseSpecializedGroup with: self sender
]
