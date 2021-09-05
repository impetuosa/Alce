Class {
	#name : #AlcixAssignment,
	#superclass : #AlcixWithAccesses,
	#instVars : [
		'#isNewObject => FMProperty',
		'#isReturn => FMProperty',
		'#owner => FMOne type: #AlcixWithAccesses opposite: #assignments',
		'#readElements => FMProperty',
		'#writeElement => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAssignment class >> annotation [

	<FMClass: #Assignment super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAssignment >> accept: aVisitor [
	^ aVisitor visitAssignment: self

]

{ #category : #testing }
AlcixAssignment >> isAssignment [

	<generated>
	^ true
]

{ #category : #accessing }
AlcixAssignment >> isNewObject [

	<FMProperty: #isNewObject type: #Boolean>
	<generated>
	^ isNewObject
]

{ #category : #accessing }
AlcixAssignment >> isNewObject: anObject [
	<generated>
	isNewObject := anObject
]

{ #category : #accessing }
AlcixAssignment >> isReturn [

	<FMProperty: #isReturn type: #Boolean>
	<generated>
	^ isReturn
]

{ #category : #accessing }
AlcixAssignment >> isReturn: anObject [
	<generated>
	isReturn := anObject
]

{ #category : #accessing }
AlcixAssignment >> owner [
	"Relation named: #owner type: #AlcixWithAccesses opposite: #assignments"

	<generated>
	<container>
	^ owner
]

{ #category : #accessing }
AlcixAssignment >> owner: anObject [

	<generated>
	owner := anObject
]

{ #category : #navigation }
AlcixAssignment >> ownerGroup [
	<generated>
	<navigation: 'Owner'>
	^ MooseSpecializedGroup with: self owner
]

{ #category : #accessing }
AlcixAssignment >> readElements [

	<FMProperty: #readElements type: #Object>
	<generated>
	^ readElements
]

{ #category : #accessing }
AlcixAssignment >> readElements: anObject [

	<generated>
	readElements := anObject.
	anObject do: [ :o | self addOutgoingAccess: o ]
]

{ #category : #accessing }
AlcixAssignment >> readElementsCandidates [

	^ self readElements flatCollect: [ :a | a candidates  ]
]

{ #category : #accessing }
AlcixAssignment >> writeElement [

	<FMProperty: #writeElement type: #Object>
	<generated>
	^ writeElement
]

{ #category : #accessing }
AlcixAssignment >> writeElement: anObject [

	<generated>
	writeElement := anObject.
	anObject do: [ :o | self addOutgoingAccess: o ]
]

{ #category : #accessing }
AlcixAssignment >> writeElementCandidates [

	^ self writeElement flatCollect: [ :a | a candidates  ]
]
