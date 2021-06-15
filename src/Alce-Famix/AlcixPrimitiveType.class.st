Class {
	#name : #AlcixPrimitiveType,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixPrimitiveType class >> annotation [

	<FMClass: #PrimitiveType super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixPrimitiveType >> accept: aVisitor [
	^ aVisitor visitPrimitiveType: self

]
