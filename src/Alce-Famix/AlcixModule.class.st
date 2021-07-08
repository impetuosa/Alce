Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#globalVariables => FMMany type: #AlcixGlobalVariable opposite: #module',
		'#astCannotLoad',
		'#ast',
		'#stringContent'
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
	 ^ astCannotLoad ifNil: [ false  ]
	
]

{ #category : #testing }
AlcixModule >> astCannotLoad: aValue [
	 astCannotLoad := aValue 
	
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

{ #category : #testing }
AlcixModule >> isAstLoaded [

	^ (astCannotLoad ifNil: [ astCannotLoad := false ]) not
]

{ #category : #'as yet unclassified' }
AlcixModule >> stringContent [

	^ stringContent ifNil: [ 
		  stringContent := self mooseModel anchorSolver
			                   readEntity: self anchor
			                   andCollect: [ :jin | jin code contents ] ]
]
