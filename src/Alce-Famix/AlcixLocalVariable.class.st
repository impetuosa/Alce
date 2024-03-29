Class {
	#name : #AlcixLocalVariable,
	#superclass : #AlcixVariable,
	#instVars : [
		'#invocable => FMOne type: #AlcixInvocable opposite: #localVariables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixLocalVariable class >> annotation [

	<FMClass: #LocalVariable super: #AlcixVariable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixLocalVariable >> accept: aVisitor [
	^ aVisitor visitLocalVariable: self

]

{ #category : #visiting }
AlcixLocalVariable >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessLocalVariable: self

]

{ #category : #accessing }
AlcixLocalVariable >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #localVariables"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixLocalVariable >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixLocalVariable >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #testing }
AlcixLocalVariable >> isLocalVariable [
	 ^ true
]
