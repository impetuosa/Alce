Class {
	#name : #AlcixAccessEntity,
	#superclass : #AlcixEntity,
	#instVars : [
		'#anchor => FMProperty',
		'#container => FMOne type: #AlcixContainer opposite: #accessEntities'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessEntity class >> annotation [

	<FMClass: #AccessEntity super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAccessEntity >> anchor [

	<FMProperty: #anchor type: #Object>
	<generated>
	^ anchor
]

{ #category : #accessing }
AlcixAccessEntity >> anchor: anObject [
	<generated>
	anchor := anObject
]

{ #category : #accessing }
AlcixAccessEntity >> container [
	"Relation named: #container type: #AlcixContainer opposite: #accessEntities"

	<generated>
	<container>
	^ container
]

{ #category : #accessing }
AlcixAccessEntity >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #navigation }
AlcixAccessEntity >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseSpecializedGroup with: self container
]
