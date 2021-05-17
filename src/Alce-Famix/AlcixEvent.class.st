Class {
	#name : #AlcixEvent,
	#superclass : #AlcixInvocable,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEvent class >> annotation [

	<FMClass: #Event super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixEvent >> accept: aVisitor [
	^ aVisitor visitEvent: self

]
