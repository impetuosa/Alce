Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#globalVariables => FMMany type: #AlcixGlobalVariable opposite: #module',
		'#astCannotLoad',
		'#ast'
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

{ #category : #navigation }
AlcixModule >> ast [

	^ ast ifNil: [ 
		  ast := self mooseModel anchorSolver
			         readEntity: self anchor
			         andCollect: [ :jin | jin ast ] ]
]

{ #category : #testing }
AlcixModule >> astCannotLoad [
	 astCannotLoad := true. 
	
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
