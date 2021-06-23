Class {
	#name : #AlcixStructure,
	#superclass : #AlcixUserType,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixStructure class >> annotation [

	<FMClass: #Structure super: #AlcixUserType>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixStructure >> accept: aVisitor [
	^ aVisitor visitStructure: self

]

{ #category : #visiting }
AlcixStructure >> types [

	^ {  }
]
