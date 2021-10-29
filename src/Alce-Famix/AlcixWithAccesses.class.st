Class {
	#name : #AlcixWithAccesses,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#assignments => FMMany type: #AlcixAssignment opposite: #owner',
		'#outgoingAccesses => FMMany type: #AlcixAccess opposite: #withAccesses'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixWithAccesses class >> annotation [

	<FMClass: #WithAccesses super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixWithAccesses >> accept: aVisitor [
	^ aVisitor visitWithAccesses: self

]

{ #category : #adding }
AlcixWithAccesses >> addAssignment: anObject [
	<generated>
	^ self assignments add: anObject
]

{ #category : #adding }
AlcixWithAccesses >> addOutgoingAccess: anObject [
	<generated>
	^ self outgoingAccesses add: anObject
]

{ #category : #accessing }
AlcixWithAccesses >> assignments [
	"Relation named: #assignments type: #AlcixAssignment opposite: #owner"

	<generated>
	<derived>
	^ assignments
]

{ #category : #accessing }
AlcixWithAccesses >> assignments: anObject [

	<generated>
	assignments value: anObject.
]

{ #category : #navigation }
AlcixWithAccesses >> assignmentsGroup [
	<generated>
	<navigation: 'Assignments'>
	^ MooseSpecializedGroup withAll: self assignments asSet
]

{ #category : #accessing }
AlcixWithAccesses >> outgoingAccesses [
	"Relation named: #outgoingAccesses type: #AlcixAccess opposite: #withAccesses"

	<generated>
	<derived>
	^ outgoingAccesses
]

{ #category : #accessing }
AlcixWithAccesses >> outgoingAccesses: anObject [

	<generated>
	outgoingAccesses value: anObject
]

{ #category : #navigation }
AlcixWithAccesses >> outgoingAccessesGroup [
	<generated>
	<navigation: 'OutgoingAccesses'>
	^ MooseSpecializedGroup withAll: self outgoingAccesses asSet
]

{ #category : #'as yet unclassified' }
AlcixWithAccesses >> outgoingInvocations [
	^ outgoingAccesses select: [  : a | a isKindOf:  AlcixInvocation ]
]

{ #category : #'as yet unclassified' }
AlcixWithAccesses >> outgoingReadAccesses [
	^ outgoingAccesses select: [  : a | a class = AlcixAccess ]
]
