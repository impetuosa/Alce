Class {
	#name : #AlcixEnum,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#enumValues => FMMany type: #AlcixEnumValue opposite: #enum'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEnum class >> annotation [

	<FMClass: #Enum super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixEnum >> accept: aVisitor [
	^ aVisitor visitEnum: self

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

{ #category : #accessing }
AlcixEnum >> invocables [

	^ {  }
]

{ #category : #accessing }
AlcixEnum >> members [

	^ enumValues
]

{ #category : #accessing }
AlcixEnum >> printOn: aStream [

	aStream
		nextPutAll: 'Enum';
		nextPutAll: '(';
		nextPutAll: name;
		nextPutAll: '-#';
		nextPutAll: enumValues size asString;
		nextPutAll: ')'
]

{ #category : #visiting }
AlcixEnum >> types [

	^ {  }
]
