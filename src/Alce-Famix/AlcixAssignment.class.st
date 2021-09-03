Class {
	#name : #AlcixAssignment,
	#superclass : #AlcixWithAccesses,
	#instVars : [
		'#isReturn => FMProperty',
		'#isNewObject => FMProperty',
		'#invocable => FMOne type: #AlcixInvocable opposite: #assignments'
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

{ #category : #accessing }
AlcixAssignment >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #assignments"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixAssignment >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixAssignment >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
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
AlcixAssignment >> readElement: aReadElement [
	
]
