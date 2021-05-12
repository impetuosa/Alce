Class {
	#name : #AlcixFunction,
	#superclass : #AlcixInvocable,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixFunction class >> annotation [

	<FMClass: #Function super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixFunction >> accept: aVisitor [
	^ aVisitor visitFunction: self

]
