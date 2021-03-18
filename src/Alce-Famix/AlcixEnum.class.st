Class {
	#name : #AlcixEnum,
	#superclass : #AlcixEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#enumValues => FMMany type: #AlcixEnumValue opposite: #enum'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEnum class >> annotation [

	<FMClass: #Enum super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixEnum >> addEnumValue: anObject [
	<generated>
	^ self enumValues add: anObject
]

{ #category : #accessing }
AlcixEnum >> enumValues [
	"Relation named: #enumValues type: #AlcixEnumValue opposite: #enum"

	<generated>
	<derived>
	^ enumValues
]

{ #category : #accessing }
AlcixEnum >> enumValues: anObject [

	<generated>
	enumValues value: anObject
]

{ #category : #navigation }
AlcixEnum >> enumValuesGroup [
	<generated>
	<navigation: 'EnumValues'>
	^ MooseSpecializedGroup withAll: self enumValues asSet
]