Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#astCannotLoad => FMProperty',
		'#ast => FMProperty',
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

{ #category : #accessing }
AlcixModule >> ast [

	<FMProperty: #ast type: #Object>
	<generated>
	^ ast
]

{ #category : #accessing }
AlcixModule >> ast: anObject [
	<generated>
	ast := anObject
]

{ #category : #accessing }
AlcixModule >> astCannotLoad [

	<FMProperty: #astCannotLoad type: #Boolean>
	<generated>
	^ astCannotLoad
]

{ #category : #accessing }
AlcixModule >> astCannotLoad: anObject [
	<generated>
	astCannotLoad := anObject
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
