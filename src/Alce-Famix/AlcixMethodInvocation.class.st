Class {
	#name : #AlcixMethodInvocation,
	#superclass : #AlcixInvocation,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #AlcixInvocation>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixMethodInvocation >> accept: aVisitor [
	^ aVisitor visitMethodInvocation: self

]
