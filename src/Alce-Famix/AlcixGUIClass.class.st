Class {
	#name : #AlcixGUIClass,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixGUIClass class >> annotation [

	<FMClass: #GUIClass super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixGUIClass >> accept: aVisitor [
	^ aVisitor visitGUIClass: self

]
