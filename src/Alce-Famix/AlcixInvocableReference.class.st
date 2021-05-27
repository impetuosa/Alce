Class {
	#name : #AlcixInvocableReference,
	#superclass : #AlcixReferenceName,
	#instVars : [
		'#invocation => FMOne type: #AlcixInvocation opposite: #selector'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocableReference class >> annotation [

	<FMClass: #InvocableReference super: #AlcixReferenceName>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixInvocableReference >> accept: aVisitor [
	^ aVisitor visitInvocableReference: self

]

{ #category : #accessing }
AlcixInvocableReference >> invocation [
	"Relation named: #invocation type: #AlcixInvocation opposite: #selector"

	<generated>
	<derived>
	^ invocation
]

{ #category : #accessing }
AlcixInvocableReference >> invocation: anObject [

	<generated>
	invocation := anObject
]

{ #category : #'as yet unclassified' }
AlcixInvocableReference >> selectorSeemsToBeMethodInvocation [
	^ names size > 1
]
