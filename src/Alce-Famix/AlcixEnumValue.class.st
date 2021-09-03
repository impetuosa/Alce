Class {
	#name : #AlcixEnumValue,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#enum => FMOne type: #AlcixEnum opposite: #enumValues',
		'#name => FMProperty',
		'#value => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEnumValue class >> annotation [

	<FMClass: #EnumValue super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixEnumValue >> accept: aVisitor [
	^ aVisitor visitEnumValue: self

]

{ #category : #accessing }
AlcixEnumValue >> enum [
	"Relation named: #enum type: #AlcixEnum opposite: #enumValues"

	<generated>
	<container>
	^ enum
]

{ #category : #accessing }
AlcixEnumValue >> enum: anObject [

	<generated>
	enum := anObject
]

{ #category : #navigation }
AlcixEnumValue >> enumGroup [
	<generated>
	<navigation: 'Enum'>
	^ MooseSpecializedGroup with: self enum
]

{ #category : #accessing }
AlcixEnumValue >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixEnumValue >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixEnumValue >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : #accessing }
AlcixEnumValue >> value: anObject [
	<generated>
	value := anObject
]
