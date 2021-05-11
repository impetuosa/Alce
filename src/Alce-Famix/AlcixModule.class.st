Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#invocables => FMMany type: #AlcixInvocable opposite: #module',
		'#globalVariables => FMMany type: #AlcixGlobalVariable opposite: #module'
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

{ #category : #visiting }
AlcixModule >> accept: aVisitor [
	^ aVisitor visitModule: self

]

{ #category : #adding }
AlcixModule >> addGlobalVariable: anObject [
	<generated>
	^ self globalVariables add: anObject
]

{ #category : #adding }
AlcixModule >> addInvocable: anObject [
	<generated>
	^ self invocables add: anObject
]

{ #category : #accessing }
AlcixModule >> globalVariables [
	"Relation named: #globalVariables type: #AlcixGlobalVariable opposite: #module"

	<generated>
	<derived>
	^ globalVariables
]

{ #category : #accessing }
AlcixModule >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject
]

{ #category : #navigation }
AlcixModule >> globalVariablesGroup [
	<generated>
	<navigation: 'GlobalVariables'>
	^ MooseSpecializedGroup withAll: self globalVariables asSet
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
