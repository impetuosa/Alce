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

{ #category : #'as yet unclassified' }
AlcixInvocableReference >> becomeVariableAccessReference [

	| newRef |
	newRef := self mooseModel instantiate: AlcixVariableReference.
	newRef names: names.
	newRef isProcessedElement: self isProcessedElement.
	self invocation: nil.
	self mooseModel removeEntity: self.
	^ newRef
]

{ #category : #'as yet unclassified' }
AlcixInvocableReference >> dropReceiverOutOfSelector [

	| piece |
	self assert: names size > 1.
	piece := (self mooseModel instantiate: AlcixVariableReference)
		         names: names allButLast;
		         yourself.
	names := { names last }.
	^ piece
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
