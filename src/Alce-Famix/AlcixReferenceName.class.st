Class {
	#name : #AlcixReferenceName,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#names => FMProperty',
		'#isProcessedElement => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReferenceName class >> annotation [

	<FMClass: #ReferenceName super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReferenceName >> accept: aVisitor [
	^ aVisitor visitReferenceName: self

]

{ #category : #'as yet unclassified' }
AlcixReferenceName >> adaptToAlceAnchorPathFragment [
	^ '.' join: names
]

{ #category : #'as yet unclassified' }
AlcixReferenceName >> isEmptyOrNil [
	^ names isEmptyOrNil  
]

{ #category : #'as yet unclassified' }
AlcixReferenceName >> isNotEmpty [
	^ names isEmptyOrNil not 
]

{ #category : #accessing }
AlcixReferenceName >> isProcessedElement [

	<FMProperty: #isProcessedElement type: #Boolean>
	<generated>
	^ isProcessedElement
]

{ #category : #accessing }
AlcixReferenceName >> isProcessedElement: anObject [
	<generated>
	isProcessedElement := anObject
]

{ #category : #accessing }
AlcixReferenceName >> isValidName [
	^ true
]

{ #category : #accessing }
AlcixReferenceName >> names [

	<FMProperty: #names type: #Object>
	<generated>
	^ names
]

{ #category : #accessing }
AlcixReferenceName >> names: anObject [
	<generated>
	names := anObject
]

{ #category : #'as yet unclassified' }
AlcixReferenceName >> referersTo: aString [
"	self assert: names size = 1."
	^ (names last compare: aString caseSensitive: false) = 2
]
