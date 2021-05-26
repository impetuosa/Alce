Class {
	#name : #AlcixVariable,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#instantiatesObjectOnDefinition => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixVariable class >> annotation [

	<FMClass: #Variable super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixVariable >> accept: aVisitor [
	^ aVisitor visitVariable: self

]

{ #category : #accessing }
AlcixVariable >> instantiatesObjectOnDefinition [

	<FMProperty: #instantiatesObjectOnDefinition type: #Boolean>
	<generated>
	^ instantiatesObjectOnDefinition
]

{ #category : #accessing }
AlcixVariable >> instantiatesObjectOnDefinition: anObject [
	<generated>
	instantiatesObjectOnDefinition := anObject
]
