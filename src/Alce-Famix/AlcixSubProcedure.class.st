Class {
	#name : #AlcixSubProcedure,
	#superclass : #AlcixInvocable,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixSubProcedure class >> annotation [

	<FMClass: #SubProcedure super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixSubProcedure >> accept: aVisitor [
	^ aVisitor visitSubProcedure: self

]
