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
AlcixAssignment >> addOutgoingAccess: anObject [
	self error: 'user readElement / writeElement'
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
AlcixAssignment >> readElement [ 
	^ outgoingAccesses at: 2 
]

{ #category : #accessing }
AlcixAssignment >> readElement: aReadElement [  
	^ outgoingAccesses at: 2 put: aReadElement 
]

{ #category : #accessing }
AlcixAssignment >> writeElement [  
	^ outgoingAccesses at: 1
]

{ #category : #accessing }
AlcixAssignment >> writeElement: anElement [

	^ outgoingAccesses at: 1 put: anElement
]
