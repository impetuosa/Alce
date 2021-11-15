Class {
	#name : #AlcixAccess,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#arguments => FMMany type: #AlcixArgument opposite: #activation',
		'#candidates => FMMany type: #AlcixAccessible opposite: #incomingAccesses',
		'#withAccesses => FMOne type: #AlcixWithAccesses opposite: #outgoingAccesses'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccess class >> annotation [

	<FMClass: #AlcixAccess super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccess >> accept: aVisitor [
	^ aVisitor visitAccess: self

]

{ #category : #visiting }
AlcixAccess >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessAccess: self

]

{ #category : #adding }
AlcixAccess >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #adding }
AlcixAccess >> addCandidate: anObject [
	<generated>
	^ self candidates add: anObject
]

{ #category : #accessing }
AlcixAccess >> arguments [
	"Relation named: #arguments type: #AlcixArgument opposite: #activation"

	<generated>
	<derived>
	^ arguments
]

{ #category : #accessing }
AlcixAccess >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : #navigation }
AlcixAccess >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseSpecializedGroup withAll: self arguments asSet
]

{ #category : #accessing }
AlcixAccess >> candidate [
	^ self candidates first 
]

{ #category : #accessing }
AlcixAccess >> candidates [
	"Relation named: #candidates type: #AlcixAccessible opposite: #incomingAccesses"

	<generated>
	<derived>
	^ candidates
]

{ #category : #accessing }
AlcixAccess >> candidates: anObject [

	<generated>
	candidates value: anObject
]

{ #category : #accessing }
AlcixAccess >> name [

	^ 'Access(' , (candidates ifEmpty: [ '' ] ifNotEmpty: [ candidates first name ]) , ')'
]

{ #category : #'as yet unclassified' }
AlcixAccess >> threeWayCompareTo: anAlcixInvocation [

	^ self name threeWayCompareTo: anAlcixInvocation name
]

{ #category : #accessing }
AlcixAccess >> withAccesses [
	"Relation named: #withAccesses type: #AlcixWithAccesses opposite: #outgoingAccesses"

	<generated>
	<container>
	^ withAccesses
]

{ #category : #accessing }
AlcixAccess >> withAccesses: anObject [

	<generated>
	withAccesses := anObject
]

{ #category : #navigation }
AlcixAccess >> withAccessesGroup [
	<generated>
	<navigation: 'WithAccesses'>
	^ MooseSpecializedGroup with: self withAccesses
]
