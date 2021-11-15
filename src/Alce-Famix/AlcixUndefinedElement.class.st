Class {
	#name : #AlcixUndefinedElement,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixUndefinedElement class >> annotation [

	<FMClass: #UndefinedElement super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixUndefinedElement >> accept: aVisitor [
	^ aVisitor visitUndefinedElement: self

]

{ #category : #visiting }
AlcixUndefinedElement >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessUndefinedElement: self

]

{ #category : #accessing }
AlcixUndefinedElement >> candidate [
	^ self 
]

{ #category : #accessing }
AlcixUndefinedElement >> isUndefined [
	 ^ false. 
]

{ #category : #accessing }
AlcixUndefinedElement >> name [

	^ 'UNDEFINED'
]
