Class {
	#name : #AlcixParameter,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#isOptional => FMProperty',
		'#invocable => FMOne type: #AlcixInvocable opposite: #parameters'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixParameter class >> annotation [

	<FMClass: #Parameter super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixParameter >> accept: aVisitor [
	^ aVisitor visitParameter: self

]

{ #category : #visiting }
AlcixParameter >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessParameter: self

]

{ #category : #accessing }
AlcixParameter >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #parameters"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixParameter >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixParameter >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #accessing }
AlcixParameter >> isOptional [

	<FMProperty: #isOptional type: #Boolean>
	<generated>
	^ isOptional
]

{ #category : #accessing }
AlcixParameter >> isOptional: anObject [
	<generated>
	isOptional := anObject
]

{ #category : #testing }
AlcixParameter >> isParameter [
	 ^ true 
]
