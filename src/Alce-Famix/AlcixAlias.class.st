Class {
	#name : #AlcixAlias,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType + AlcixTTyped',
	#classTraits : 'AlcixTType classTrait + AlcixTTyped classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAlias class >> annotation [

	<FMClass: #Alias super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAlias >> accept: aVisitor [
	^ aVisitor visitAlias: self

]
