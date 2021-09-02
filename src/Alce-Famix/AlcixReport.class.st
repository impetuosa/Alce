Class {
	#name : #AlcixReport,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReport class >> annotation [

	<FMClass: #Report super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReport >> accept: aVisitor [
	^ aVisitor visitReport: self

]
