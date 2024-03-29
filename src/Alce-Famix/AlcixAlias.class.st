Class {
	#name : #AlcixAlias,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType + AlcixTTyped',
	#classTraits : 'AlcixTType classTrait + AlcixTTyped classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAlias class >> annotation [

	<FMClass: #Alias super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAlias >> accept: aVisitor [
	^ aVisitor visitAlias: self

]

{ #category : #visiting }
AlcixAlias >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessAlias: self

]

{ #category : #accessing }
AlcixAlias >> userType [

	^ type
]
