Class {
	#name : #AlcixExternalFunction,
	#superclass : #AlcixFunction,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixExternalFunction class >> annotation [

	<FMClass: #ExternalFunction super: #AlcixFunction>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixExternalFunction >> accept: aVisitor [
	^ aVisitor visitExternalFunction: self

]
