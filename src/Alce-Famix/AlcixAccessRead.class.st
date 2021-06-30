Class {
	#name : #AlcixAccessRead,
	#superclass : #AlcixAccess,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessRead class >> annotation [

	<FMClass: #AccessRead super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessRead >> accept: aVisitor [
	^ aVisitor visitAccessRead: self

]

{ #category : #visiting }
AlcixAccessRead >> color [

	^ rightElement
		  ifNil: [ super color ]
		  ifNotNil: [ rightElement color ]
]

{ #category : #visiting }
AlcixAccessRead >> isWriting [

	^ false
]
