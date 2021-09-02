Class {
	#name : #AlcixForm,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixForm class >> annotation [

	<FMClass: #Form super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixForm >> accept: aVisitor [
	^ aVisitor visitForm: self

]
