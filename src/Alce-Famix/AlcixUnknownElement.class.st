Class {
	#name : #AlcixUnknownElement,
	#superclass : #AlcixUndefinedElement,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixUnknownElement class >> annotation [

	<FMClass: #UnknownElement super: #AlcixUndefinedElement>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixUnknownElement >> accept: aVisitor [
	^ aVisitor visitUnknownElement: self

]
