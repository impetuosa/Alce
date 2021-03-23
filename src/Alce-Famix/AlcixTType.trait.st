Trait {
	#name : #AlcixTType,
	#instVars : [
		'#container => FMOne type: #AlcixContainer opposite: #types',
		'#function => FMOne type: #AlcixFunction opposite: #type',
		'#typedEntity => FMOne type: #AlcixTypedEntity opposite: #type'
	],
	#category : #'Alce-Famix-Traits'
}

{ #category : #meta }
AlcixTType classSide >> annotation [

	<FMClass: #TType super: #Object>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixTType >> container [
	"Relation named: #container type: #AlcixContainer opposite: #types"

	<generated>
	<container>
	^ container
]

{ #category : #accessing }
AlcixTType >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #navigation }
AlcixTType >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseSpecializedGroup with: self container
]

{ #category : #accessing }
AlcixTType >> function [
	"Relation named: #function type: #AlcixFunction opposite: #type"

	<generated>
	<container>
	<derived>
	^ function
]

{ #category : #accessing }
AlcixTType >> function: anObject [

	<generated>
	function := anObject
]

{ #category : #navigation }
AlcixTType >> functionGroup [
	<generated>
	<navigation: 'Function'>
	^ MooseSpecializedGroup with: self function
]

{ #category : #accessing }
AlcixTType >> typedEntity [
	"Relation named: #typedEntity type: #AlcixTypedEntity opposite: #type"

	<generated>
	<container>
	<derived>
	^ typedEntity
]

{ #category : #accessing }
AlcixTType >> typedEntity: anObject [

	<generated>
	typedEntity := anObject
]

{ #category : #navigation }
AlcixTType >> typedEntityGroup [
	<generated>
	<navigation: 'TypedEntity'>
	^ MooseSpecializedGroup with: self typedEntity
]
