Class {
	#name : #AlcixEnum,
	#superclass : #AlcixAccessEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEnum class >> annotation [

	<FMClass: #Enum super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixEnum >> accept: aVisitor [
	^ aVisitor visitEnum: self

]
