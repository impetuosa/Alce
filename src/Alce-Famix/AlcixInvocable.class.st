Class {
	#name : #AlcixInvocable,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#parameters => FMMany type: #AlcixParameter opposite: #invocable',
		'#accesses => FMMany type: #AlcixAccess opposite: #invocable',
		'#invocation => FMOne type: #AlcixInvocation opposite: #invocable',
		'#module => FMOne type: #AlcixModule opposite: #invocables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocable class >> annotation [

	<FMClass: #Invocable super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixInvocable >> accesses [
	"Relation named: #accesses type: #AlcixAccess opposite: #invocable"

	<generated>
	<derived>
	^ accesses
]

{ #category : #accessing }
AlcixInvocable >> accesses: anObject [

	<generated>
	accesses value: anObject
]

{ #category : #navigation }
AlcixInvocable >> accessesGroup [
	<generated>
	<navigation: 'Accesses'>
	^ MooseSpecializedGroup withAll: self accesses asSet
]

{ #category : #adding }
AlcixInvocable >> addAccess: anObject [
	<generated>
	^ self accesses add: anObject
]

{ #category : #adding }
AlcixInvocable >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
AlcixInvocable >> invocation [
	"Relation named: #invocation type: #AlcixInvocation opposite: #invocable"

	<generated>
	<container>
	<derived>
	^ invocation
]

{ #category : #accessing }
AlcixInvocable >> invocation: anObject [

	<generated>
	invocation := anObject
]

{ #category : #navigation }
AlcixInvocable >> invocationGroup [
	<generated>
	<navigation: 'Invocation'>
	^ MooseSpecializedGroup with: self invocation
]

{ #category : #accessing }
AlcixInvocable >> module [
	"Relation named: #module type: #AlcixModule opposite: #invocables"

	<generated>
	<container>
	^ module
]

{ #category : #accessing }
AlcixInvocable >> module: anObject [

	<generated>
	module := anObject
]

{ #category : #navigation }
AlcixInvocable >> moduleGroup [
	<generated>
	<navigation: 'Module'>
	^ MooseSpecializedGroup with: self module
]

{ #category : #accessing }
AlcixInvocable >> parameters [
	"Relation named: #parameters type: #AlcixParameter opposite: #invocable"

	<generated>
	<derived>
	^ parameters
]

{ #category : #accessing }
AlcixInvocable >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #navigation }
AlcixInvocable >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseSpecializedGroup withAll: self parameters asSet
]
