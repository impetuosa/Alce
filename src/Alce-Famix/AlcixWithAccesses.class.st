Class {
	#name : #AlcixWithAccesses,
	#superclass : #AlcixAccessible,
	#instVars : [
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
AlcixWithAccesses >> addOutgoingAccess: anObject [
	<generated>
	^ self outgoingAccesses add: anObject
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
