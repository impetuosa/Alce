Class {
	#name : #AlcixAccessible,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#incomingAccesses => FMMany type: #AlcixAccess opposite: #candidates'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessible class >> annotation [

	<FMClass: #Accessible super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessible >> accept: aVisitor [
	^ aVisitor visitAccessible: self

]

{ #category : #adding }
AlcixAccessible >> addIncomingAccess: anObject [
	<generated>
	^ self incomingAccesses add: anObject
]

{ #category : #accessing }
AlcixAccessible >> incomingAccesses [
	"Relation named: #incomingAccesses type: #AlcixAccess opposite: #candidates"

	<generated>
	^ incomingAccesses
]

{ #category : #accessing }
AlcixAccessible >> incomingAccesses: anObject [

	<generated>
	incomingAccesses value: anObject
]
