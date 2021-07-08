Class {
	#name : #AlcixAccessModule,
	#superclass : #AlcixReference,
	#instVars : [
		'#references => FMMany type: #AlcixReference opposite: #accessModule',
		'#secondary'
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

{ #category : #adding }
AlcixAccessModule >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #navigation }
AlcixAccessModule >> addSecondary: aRef [
	secondary add: aRef. 
]

{ #category : #navigation }
AlcixAccessModule >> initialize [

	super initialize.
	secondary := OrderedCollection new
]

{ #category : #adding }
AlcixAccessModule >> isAccessModule [

	^ true
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

{ #category : #adding }
AlcixAccessModule >> registerReference: anObject [

	^ secondary add: anObject
]
