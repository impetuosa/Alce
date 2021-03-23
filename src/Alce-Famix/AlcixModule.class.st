Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#members => FMMany type: #AlcixTypedEntity opposite: #module',
		'#invocables => FMMany type: #AlcixInvocable opposite: #module'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixModule class >> annotation [

	<FMClass: #Module super: #AlcixContainer>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixModule >> addInvocable: anObject [
	<generated>
	^ self invocables add: anObject
]

{ #category : #adding }
AlcixModule >> addMember: anObject [
	<generated>
	^ self members add: anObject
]

{ #category : #accessing }
AlcixModule >> invocables [
	"Relation named: #invocables type: #AlcixInvocable opposite: #module"

	<generated>
	<derived>
	^ invocables
]

{ #category : #accessing }
AlcixModule >> invocables: anObject [

	<generated>
	invocables value: anObject
]

{ #category : #navigation }
AlcixModule >> invocablesGroup [
	<generated>
	<navigation: 'Invocables'>
	^ MooseSpecializedGroup withAll: self invocables asSet
]

{ #category : #accessing }
AlcixModule >> members [
	"Relation named: #members type: #AlcixTypedEntity opposite: #module"

	<generated>
	<derived>
	^ members
]

{ #category : #accessing }
AlcixModule >> members: anObject [

	<generated>
	members value: anObject
]

{ #category : #navigation }
AlcixModule >> membersGroup [
	<generated>
	<navigation: 'Members'>
	^ MooseSpecializedGroup withAll: self members asSet
]
