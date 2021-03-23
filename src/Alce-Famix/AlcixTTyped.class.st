Class {
	#name : #AlcixTTyped,
	#superclass : #AlcixEntity,
	#instVars : [
		'#type => FMOne type: #AlcixTType opposite: #tTyped',
		'#typeName => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTTyped class >> annotation [

	<FMClass: #TTyped super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixTTyped >> type [
	"Relation named: #type type: #AlcixTType opposite: #tTyped"

	<generated>
	^ type
]

{ #category : #accessing }
AlcixTTyped >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
AlcixTTyped >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]

{ #category : #accessing }
AlcixTTyped >> typeName [

	<FMProperty: #typeName type: #String>
	<generated>
	^ typeName
]

{ #category : #accessing }
AlcixTTyped >> typeName: anObject [
	<generated>
	typeName := anObject
]
