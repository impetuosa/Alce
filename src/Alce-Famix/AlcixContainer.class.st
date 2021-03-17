Class {
	#name : #AlcixContainer,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#accessEntities => FMMany type: #AlcixAccessEntity opposite: #container'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixContainer class >> annotation [

	<FMClass: #Container super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixContainer >> accessEntities [
	"Relation named: #accessEntities type: #AlcixAccessEntity opposite: #container"

	<generated>
	<derived>
	^ accessEntities
]

{ #category : #accessing }
AlcixContainer >> accessEntities: anObject [

	<generated>
	accessEntities value: anObject
]

{ #category : #navigation }
AlcixContainer >> accessEntitiesGroup [
	<generated>
	<navigation: 'AccessEntities'>
	^ MooseSpecializedGroup withAll: self accessEntities asSet
]

{ #category : #adding }
AlcixContainer >> addAccessEntity: anObject [
	<generated>
	^ self accessEntities add: anObject
]
