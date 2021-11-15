Class {
	#name : #AlcixExpression,
	#superclass : #AlcixWithAccesses,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixExpression class >> annotation [

	<FMClass: #Expression super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixExpression >> accept: aVisitor [
	^ aVisitor visitExpression: self

]

{ #category : #visiting }
AlcixExpression >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessExpression: self

]

{ #category : #accessing }
AlcixExpression >> arguments [

	^ {  }
]

{ #category : #accessing }
AlcixExpression >> candidates [
	 ^ outgoingAccesses flatCollect: [ : o | o candidates ]
]
