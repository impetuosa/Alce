Class {
	#name : #AlcixAccessWrite,
	#superclass : #AlcixAccess,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessWrite class >> annotation [

	<FMClass: #AccessWrite super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessWrite >> accept: aVisitor [
	^ aVisitor visitAccessWrite: self

]
