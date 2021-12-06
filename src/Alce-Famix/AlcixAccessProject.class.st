Class {
	#name : #AlcixAccessProject,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#modules => FMMany type: #AlcixAccessModule opposite: #project'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessProject class >> annotation [

	<FMClass: #AccessProject super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessProject >> accept: aVisitor [
	^ aVisitor visitAccessProject: self

]

{ #category : #visiting }
AlcixAccessProject >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessAccessProject: self

]

{ #category : #adding }
AlcixAccessProject >> addModule: anObject [
	<generated>
	^ self modules add: anObject
]

{ #category : #accessing }
AlcixAccessProject >> modules [
	"Relation named: #modules type: #AlcixAccessModule opposite: #project"

	<generated>
	<derived>
	^ modules
]

{ #category : #accessing }
AlcixAccessProject >> modules: anObject [

	<generated>
	modules value: anObject
]

{ #category : #navigation }
AlcixAccessProject >> modulesGroup [
	<generated>
	<navigation: 'Modules'>
	^ MooseSpecializedGroup withAll: self modules asSet
]

{ #category : #navigation }
AlcixAccessProject >> name [ 
	^ 'Project'
]
