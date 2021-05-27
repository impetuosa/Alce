Class {
	#name : #AlcixAccess,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#isWriting => FMProperty',
		'#rightElement => FMOne type: #AlcixAccessible opposite: #readingAccesses',
		'#invocable => FMOne type: #AlcixInvocable opposite: #accesses',
		'#rightElementName => FMOne type: #AlcixVariableReference opposite: #access'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccess class >> annotation [

	<FMClass: #Access super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccess >> accept: aVisitor [
	^ aVisitor visitAccess: self

]

{ #category : #accessing }
AlcixAccess >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #accesses"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixAccess >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixAccess >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #accessing }
AlcixAccess >> isWriting [

	<FMProperty: #isWriting type: #Boolean>
	<generated>
	^ isWriting
]

{ #category : #accessing }
AlcixAccess >> isWriting: anObject [
	<generated>
	isWriting := anObject
]

{ #category : #accessing }
AlcixAccess >> rightElement [
	"Relation named: #rightElement type: #AlcixAccessible opposite: #readingAccesses"

	<generated>
	^ rightElement
]

{ #category : #accessing }
AlcixAccess >> rightElement: anObject [

	<generated>
	rightElement := anObject
]

{ #category : #accessing }
AlcixAccess >> rightElementName [
	"Relation named: #rightElementName type: #AlcixVariableReference opposite: #access"

	<generated>
	^ rightElementName
]

{ #category : #accessing }
AlcixAccess >> rightElementName: anObject [

	<generated>
	rightElementName := anObject
]
