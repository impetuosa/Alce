Class {
	#name : #AlcixMethodInvocation,
	#superclass : #AlcixInvocation,
	#instVars : [
		'#receiver => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #AlcixInvocation>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixMethodInvocation >> accept: aVisitor [
	^ aVisitor visitMethodInvocation: self

]

{ #category : #accessing }
AlcixMethodInvocation >> receiver [

	<FMProperty: #receiver type: #Object>
	<generated>
	^ receiver
]

{ #category : #accessing }
AlcixMethodInvocation >> receiver: anObject [
	<generated>
	receiver := anObject
]

{ #category : #'as yet unclassified' }
AlcixMethodInvocation >> signatureSelector [

	| parts |
	parts := '.' split: selector.
	parts size = 1 ifTrue: [ ^ parts first ].
	parts size = 2 ifTrue: [ ^ parts second ].
	self error: ' Not ready for chained messages '
]
