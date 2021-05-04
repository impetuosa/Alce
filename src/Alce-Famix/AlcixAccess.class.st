Class {
	#name : #AlcixAccess,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#isWriting => FMProperty',
		'#attributeName => FMProperty',
		'#member => FMProperty',
		'#attribute => FMOne type: #AlcixAccessible opposite: #access',
		'#invocable => FMOne type: #AlcixInvocable opposite: #accesses'
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
AlcixAccess >> attribute [
	"Relation named: #attribute type: #AlcixAccessible opposite: #access"

	<generated>
	^ attribute
]

{ #category : #accessing }
AlcixAccess >> attribute: anObject [

	<generated>
	attribute := anObject
]

{ #category : #accessing }
AlcixAccess >> attributeName [

	<FMProperty: #attributeName type: #String>
	<generated>
	^ attributeName
]

{ #category : #accessing }
AlcixAccess >> attributeName: anObject [
	<generated>
	attributeName := anObject
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
AlcixAccess >> member [

	<FMProperty: #member type: #Object>
	<generated>
	^ member
]

{ #category : #accessing }
AlcixAccess >> member: anObject [
	<generated>
	member := anObject
]
