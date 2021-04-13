Class {
	#name : #AlcixAccess,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#isWriting => FMProperty',
		'#attributeName => FMProperty',
		'#memberSelectors => FMProperty',
		'#attribute => FMOne type: #AlcixAttribute opposite: #accesses',
		'#invocable => FMOne type: #AlcixInvocable opposite: #accesses'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccess class >> annotation [

	<FMClass: #Access super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAccess >> attribute [
	"Relation named: #attribute type: #AlcixAttribute opposite: #accesses"

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

{ #category : #'as yet unclassified' }
AlcixAccess >> memberSelectors: aCollection [ 
	memberSelectors := aCollection
]
