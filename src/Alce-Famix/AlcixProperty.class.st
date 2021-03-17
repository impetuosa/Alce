Class {
	#name : #AlcixProperty,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#propertyAccessors => FMMany type: #AlcixPropertyAccessor opposite: #property',
		'#attribute => FMOne type: #AlcixAttribute opposite: #property'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixProperty class >> annotation [

	<FMClass: #Property super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixProperty >> addPropertyAccessor: anObject [
	<generated>
	^ self propertyAccessors add: anObject
]

{ #category : #accessing }
AlcixProperty >> attribute [
	"Relation named: #attribute type: #AlcixAttribute opposite: #property"

	<generated>
	^ attribute
]

{ #category : #accessing }
AlcixProperty >> attribute: anObject [

	<generated>
	attribute := anObject
]

{ #category : #accessing }
AlcixProperty >> propertyAccessors [
	"Relation named: #propertyAccessors type: #AlcixPropertyAccessor opposite: #property"

	<generated>
	<derived>
	^ propertyAccessors
]

{ #category : #accessing }
AlcixProperty >> propertyAccessors: anObject [

	<generated>
	propertyAccessors value: anObject
]

{ #category : #navigation }
AlcixProperty >> propertyAccessorsGroup [
	<generated>
	<navigation: 'PropertyAccessors'>
	^ MooseSpecializedGroup withAll: self propertyAccessors asSet
]
