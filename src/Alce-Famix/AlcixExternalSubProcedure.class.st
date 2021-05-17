Class {
	#name : #AlcixExternalSubProcedure,
	#superclass : #AlcixSubProcedure,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixExternalSubProcedure class >> annotation [

	<FMClass: #ExternalSubProcedure super: #AlcixSubProcedure>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixExternalSubProcedure >> accept: aVisitor [
	^ aVisitor visitExternalSubProcedure: self

]
