Class {
	#name : #AlcixReferenceName,
	#superclass : #AlcixEntity,
	#instVars : [
		'#names => FMProperty'
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
