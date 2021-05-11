Class {
	#name : #AlcixForm,
	#superclass : #AlcixGUIClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixForm class >> annotation [

	<FMClass: #Form super: #AlcixGUIClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixForm >> accept: aVisitor [
	^ aVisitor visitForm: self

]
