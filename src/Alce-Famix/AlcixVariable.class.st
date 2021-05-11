Class {
	#name : #AlcixVariable,
	#superclass : #AlcixTypedEntity,
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
