Class {
	#name : #AlcixAttribute,
	#superclass : #AlcixVariable,
	#instVars : [
		'#attributeAccessors => FMMany type: #AlcixAttributeAccessor opposite: #attribute',
		'#userType => FMOne type: #AlcixUserType opposite: #members'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAttribute class >> annotation [

	<FMClass: #Attribute super: #AlcixVariable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAttribute >> accept: aVisitor [
	^ aVisitor visitAttribute: self

]

{ #category : #adding }
AlcixAttribute >> addAttributeAccessor: anObject [
	<generated>
	^ self attributeAccessors add: anObject
]

{ #category : #accessing }
AlcixAttribute >> attributeAccessors [
	"Relation named: #attributeAccessors type: #AlcixAttributeAccessor opposite: #attribute"

	<generated>
	<derived>
	^ attributeAccessors
]

{ #category : #accessing }
AlcixAttribute >> attributeAccessors: anObject [

	<generated>
	attributeAccessors value: anObject
]

{ #category : #navigation }
AlcixAttribute >> attributeAccessorsGroup [
	<generated>
	<navigation: 'AttributeAccessors'>
	^ MooseSpecializedGroup withAll: self attributeAccessors asSet
]

{ #category : #accessing }
AlcixAttribute >> userType [
	"Relation named: #userType type: #AlcixUserType opposite: #members"

	<generated>
	<container>
	^ userType
]

{ #category : #accessing }
AlcixAttribute >> userType: anObject [

	<generated>
	userType := anObject
]

{ #category : #navigation }
AlcixAttribute >> userTypeGroup [
	<generated>
	<navigation: 'UserType'>
	^ MooseSpecializedGroup with: self userType
]
