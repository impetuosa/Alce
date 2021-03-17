Class {
	#name : #AlcixAccessEntity,
	#superclass : #AlcixEntity,
	#instVars : [
		'#accessAnchor => FMOne type: #AlcixAccessAnchor opposite: #accessEntity',
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
AlcixAccessEntity >> accessAnchor [
	"Relation named: #accessAnchor type: #AlcixAccessAnchor opposite: #accessEntity"

	<generated>
	^ accessAnchor
]

{ #category : #accessing }
AlcixAccessEntity >> accessAnchor: anObject [

	<generated>
	accessAnchor := anObject
]

{ #category : #navigation }
AlcixAccessEntity >> accessAnchorGroup [
	<generated>
	<navigation: 'AccessAnchor'>
	^ MooseSpecializedGroup with: self accessAnchor
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
