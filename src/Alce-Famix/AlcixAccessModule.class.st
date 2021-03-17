Class {
	#name : #AlcixAccessModule,
	#superclass : #AlcixReference,
	#instVars : [
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

{ #category : #adding }
AlcixAccessModule >> addReference: anObject [
	<generated>
	^ self references add: anObject
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
