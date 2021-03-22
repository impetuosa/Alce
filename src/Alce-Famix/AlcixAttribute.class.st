Class {
	#name : #AlcixAttribute,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#isConstant => FMProperty',
		'#accesses => FMMany type: #AlcixAccess opposite: #attribute',
		'#attributeAccessors => FMMany type: #AlcixAttributeAccessor opposite: #attribute'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAttribute class >> annotation [

	<FMClass: #Attribute super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAttribute >> accesses [
	"Relation named: #accesses type: #AlcixAccess opposite: #attribute"

	<generated>
	<derived>
	^ accesses
]

{ #category : #accessing }
AlcixAttribute >> accesses: anObject [

	<generated>
	accesses value: anObject
]

{ #category : #adding }
AlcixAttribute >> addAccess: anObject [
	<generated>
	^ self accesses add: anObject
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
AlcixAttribute >> isConstant [

	<FMProperty: #isConstant type: #Boolean>
	<generated>
	^ isConstant
]

{ #category : #accessing }
AlcixAttribute >> isConstant: anObject [
	<generated>
	isConstant := anObject
]
