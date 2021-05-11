Class {
	#name : #AlcixMacro,
	#superclass : #AlcixInvocable,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixMacro class >> annotation [

	<FMClass: #Macro super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixMacro >> accept: aVisitor [
	^ aVisitor visitMacro: self

]
