Class {
	#name : #AlcixVariable,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#instantiatesObjectOnDefinition => FMProperty',
		'#redim'
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

{ #category : #redim }
AlcixVariable >> redim [

	<FMProperty: #redim type: #String>
	<generated>
	^ redim
]

{ #category : #redim }
AlcixVariable >> redim: aString [ 
	redim ifNotNil:[ self halt.  ] .
	redim := aString
]
