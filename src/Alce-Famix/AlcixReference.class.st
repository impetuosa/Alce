Class {
	#name : #AlcixReference,
	#superclass : #AlcixContainer,
	#instVars : [
		'#path => FMProperty',
		'#accessModule => FMOne type: #AlcixAccessModule opposite: #references'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReference class >> annotation [

	<FMClass: #Reference super: #AlcixContainer>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReference >> accept: aVisitor [
	^ aVisitor visitReference: self

]

{ #category : #accessing }
AlcixReference >> accessModule [
	"Relation named: #accessModule type: #AlcixAccessModule opposite: #references"

	<generated>
	<container>
	^ accessModule
]

{ #category : #accessing }
AlcixReference >> accessModule: anObject [

	<generated>
	accessModule := anObject
]

{ #category : #navigation }
AlcixReference >> accessModuleGroup [
	<generated>
	<navigation: 'AccessModule'>
	^ MooseSpecializedGroup with: self accessModule
]

{ #category : #accessing }
AlcixReference >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixReference >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixReference >> path [

	<FMProperty: #path type: #String>
	<generated>
	^ path
]

{ #category : #accessing }
AlcixReference >> path: anObject [
	<generated>
	path := anObject
]
