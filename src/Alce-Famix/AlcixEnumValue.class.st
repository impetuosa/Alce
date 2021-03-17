Class {
	#name : #AlcixEnumValue,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#name => FMProperty',
		'#Value => FMProperty',
		'#enum => FMOne type: #AlcixEnum opposite: #enumValues'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEnumValue class >> annotation [

	<FMClass: #EnumValue super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixEnumValue >> Value [

	<FMProperty: #Value type: #Object>
	<generated>
	^ Value
]

{ #category : #accessing }
AlcixEnumValue >> Value: anObject [
	<generated>
	Value := anObject
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
