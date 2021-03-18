Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainerType,
	#instVars : [
		'#invocables => FMMany type: #AlcixInvocable opposite: #module'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixModule class >> annotation [

	<FMClass: #Module super: #AlcixContainerType>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixModule >> addInvocable: anObject [
	<generated>
	^ self invocables add: anObject
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