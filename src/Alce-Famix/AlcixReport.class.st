Class {
	#name : #AlcixReport,
	#superclass : #AlcixGUIClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReport class >> annotation [

	<FMClass: #Report super: #AlcixGUIClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReport >> accept: aVisitor [
	^ aVisitor visitReport: self

]
