Class {
	#name : #AlcixRaiseEvent,
	#superclass : #AlcixInvocation,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixRaiseEvent class >> annotation [

	<FMClass: #RaiseEvent super: #AlcixInvocation>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixRaiseEvent >> accept: aVisitor [
	^ aVisitor visitRaiseEvent: self

]

{ #category : #visiting }
AlcixRaiseEvent >> name [

	^ 'Raise(' , (candidates ifEmpty: [ '' ] ifNotEmpty: [ candidates first name ]) , ')'
]
