Class {
	#name : #AlcixEnumValue,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#name => FMProperty',
		'#Value => FMProperty',
		'#enum => FMOne type: #AlcixEnum opposite: #enumValues'
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

{ #category : #navigation }
AlcixEnumValue >> printOn: aStream [

	aStream
		nextPutAll: 'Enum ';
		nextPutAll: enum name;
		nextPutAll: '.';
		nextPutAll: name
]

{ #category : #'as yet unclassified' }
AlcixEnumValue >> threeWayCompareTo: anAlcixEnumValue [

	anAlcixEnumValue class = self class ifFalse: [ 
		^ super threeWayCompareTo: anAlcixEnumValue ].

	^ self Value asString threeWayCompareTo:
		  anAlcixEnumValue Value asString
]

{ #category : #accessing }
AlcixEnumValue >> type [

	^ enum
]

{ #category : #accessing }
AlcixEnumValue >> typeName [ 

	^ enum name 
]
