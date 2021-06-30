Class {
	#name : #AlcixAttribute,
	#superclass : #AlcixVariable,
	#instVars : [
		'#isConstant => FMProperty',
		'#visibility => FMProperty',
		'#userType => FMOne type: #AlcixUserType opposite: #members',
		'#attributeAccessors => FMMany type: #AlcixAttributeAccessor opposite: #attribute'
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

{ #category : #converting }
AlcixAttribute >> asType [

	self assert: typeName names size = 1.
	^ userType types detect: [ :t | t name = typeName names first ]
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

{ #category : #converting }
AlcixAttribute >> includedColorsInto: colors [

	userType ifNotNil: [ colors add: userType color ]
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

{ #category : #accessing }
AlcixAttribute >> visibility [

	<FMProperty: #visibility type: #String>
	<generated>
	^ visibility
]

{ #category : #accessing }
AlcixAttribute >> visibility: anObject [
	<generated>
	visibility := anObject
]
