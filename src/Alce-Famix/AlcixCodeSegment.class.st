Class {
	#name : #AlcixCodeSegment,
	#superclass : #AlcixAccessEntity,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixCodeSegment class >> annotation [

	<FMClass: #CodeSegment super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixCodeSegment >> accept: aVisitor [
	^ aVisitor visitCodeSegment: self

]
