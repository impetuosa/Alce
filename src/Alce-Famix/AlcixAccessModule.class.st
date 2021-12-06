Class {
	#name : #AlcixAccessModule,
	#superclass : #AlcixReference,
	#instVars : [
		'#project => FMOne type: #AlcixAccessProject opposite: #modules',
		'#references => FMMany type: #AlcixReference opposite: #accessModule'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessModule class >> annotation [

	<FMClass: #AccessModule super: #AlcixReference>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessModule >> accept: aVisitor [
	^ aVisitor visitAccessModule: self

]

{ #category : #visiting }
AlcixAccessModule >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessAccessModule: self

]

{ #category : #adding }
AlcixAccessModule >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #accessing }
AlcixAccessModule >> forms [

	^ types select: [ :a | a isKindOf: AlcixForm ]
]

{ #category : #navigation }
AlcixAccessModule >> isAccessModule [
	^ true 
]

{ #category : #testing }
AlcixAccessModule >> isBuiltIn [
	^ false
]

{ #category : #'instance creation' }
AlcixAccessModule >> modules [

	^ self types select: [ :a | a class = AlcixModule ]
]

{ #category : #'as yet unclassified' }
AlcixAccessModule >> parentalModule [
	^ self 
]

{ #category : #accessing }
AlcixAccessModule >> project [
	"Relation named: #project type: #AlcixAccessProject opposite: #modules"

	<generated>
	<container>
	^ project
]

{ #category : #accessing }
AlcixAccessModule >> project: anObject [

	<generated>
	project := anObject
]

{ #category : #navigation }
AlcixAccessModule >> projectGroup [
	<generated>
	<navigation: 'Project'>
	^ MooseSpecializedGroup with: self project
]

{ #category : #accessing }
AlcixAccessModule >> references [
	"Relation named: #references type: #AlcixReference opposite: #accessModule"

	<generated>
	<derived>
	^ references
]

{ #category : #accessing }
AlcixAccessModule >> references: anObject [

	<generated>
	references value: anObject
]

{ #category : #navigation }
AlcixAccessModule >> referencesGroup [
	<generated>
	<navigation: 'References'>
	^ MooseSpecializedGroup withAll: self references asSet
]
