Class {
	#name : #AlcixParameter,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#arguments => FMMany type: #AlcixArgument opposite: #parameter',
		'#invocable => FMOne type: #AlcixInvocable opposite: #parameters'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixParameter class >> annotation [

	<FMClass: #Parameter super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixParameter >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
AlcixParameter >> arguments [
	"Relation named: #arguments type: #AlcixArgument opposite: #parameter"

	<generated>
	<derived>
	^ arguments
]

{ #category : #accessing }
AlcixParameter >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : #accessing }
AlcixParameter >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #parameters"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixParameter >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixParameter >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]
