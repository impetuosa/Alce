Class {
	#name : #AlcixInvocation,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#invocable => FMOne type: #AlcixInvocable opposite: #invocation'
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

{ #category : #accessing }
AlcixInvocation >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #invocation"

	<generated>
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
