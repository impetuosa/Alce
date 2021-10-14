Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTypedEntity class >> annotation [

	<FMClass: #TypedEntity super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixTypedEntity >> accept: aVisitor [
	^ aVisitor visitTypedEntity: self

]

{ #category : #accessing }
AlcixTypedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixTypedEntity >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #'as yet unclassified' }
AlcixTypedEntity >> threeWayCompareTo: anAlcixAttributeAccessor [ 
	^ name threeWayCompareTo: anAlcixAttributeAccessor name
]
