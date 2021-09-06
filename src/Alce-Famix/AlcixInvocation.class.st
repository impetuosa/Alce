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
AlcixInvocation >> name [

	^ 'Invocation(' , (candidates ifEmpty: [ '' ] ifNotEmpty: [ candidates first name ]) , ')'
]

{ #category : #accessing }
AlcixInvocation >> userType [
	^ withAccesses userType 
]
