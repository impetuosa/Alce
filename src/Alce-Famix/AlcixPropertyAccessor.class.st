Class {
	#name : #AlcixPropertyAccessor,
	#superclass : #AlcixInvocable,
	#instVars : [
		'#kind => FMProperty',
		'#property => FMOne type: #AlcixProperty opposite: #propertyAccessors'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixPropertyAccessor class >> annotation [

	<FMClass: #PropertyAccessor super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixPropertyAccessor >> kind [

	<FMProperty: #kind type: #String>
	<generated>
	^ kind
]

{ #category : #accessing }
AlcixPropertyAccessor >> kind: anObject [
	<generated>
	kind := anObject
]

{ #category : #accessing }
AlcixPropertyAccessor >> property [
	"Relation named: #property type: #AlcixProperty opposite: #propertyAccessors"

	<generated>
	<container>
	^ property
]

{ #category : #accessing }
AlcixPropertyAccessor >> property: anObject [

	<generated>
	property := anObject
]

{ #category : #navigation }
AlcixPropertyAccessor >> propertyGroup [
	<generated>
	<navigation: 'Property'>
	^ MooseSpecializedGroup with: self property
]
