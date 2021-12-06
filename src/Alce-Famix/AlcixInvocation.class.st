Class {
	#name : #AlcixInvocation,
	#superclass : #AlcixAccess,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixInvocation class >> annotation [

	<FMClass: #Invocation super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixInvocation >> accept: aVisitor [
	^ aVisitor visitInvocation: self

]

{ #category : #visiting }
AlcixInvocation >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessInvocation: self

]

{ #category : #visiting }
AlcixInvocation >> name [

	^ 'Invocation(' , (candidates ifEmpty: [ '' ] ifNotEmpty: [ candidates first name ]) , ')'
]

{ #category : #accessing }
AlcixInvocation >> selector [

	self assert: candidates size = 1.
	^ candidates first selector
]

{ #category : #accessing }
AlcixInvocation >> userType [
	^ withAccesses userType 
]
