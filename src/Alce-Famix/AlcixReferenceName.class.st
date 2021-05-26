Class {
	#name : #AlcixReferenceName,
	#superclass : #AlcixEntity,
	#instVars : [
		'#names => FMProperty',
		'#processedElement => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReferenceName class >> annotation [

	<FMClass: #ReferenceName super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReferenceName >> accept: aVisitor [
	^ aVisitor visitReferenceName: self

]

{ #category : #accessing }
AlcixReferenceName >> isNotEmpty [
	^ names isEmptyOrNil not 
]

{ #category : #accessing }
AlcixReferenceName >> isValidName [
	^ true
]

{ #category : #accessing }
AlcixReferenceName >> names [

	<FMProperty: #names type: #Object>
	<generated>
	^ names
]

{ #category : #accessing }
AlcixReferenceName >> names: anObject [
	<generated>
	names := anObject
]

{ #category : #accessing }
AlcixReferenceName >> processedElement [

	<FMProperty: #processedElement type: #Boolean>
	<generated>
	^ names
]

{ #category : #accessing }
AlcixReferenceName >> processedElement: anObject [
	<generated>
	processedElement := anObject
]
