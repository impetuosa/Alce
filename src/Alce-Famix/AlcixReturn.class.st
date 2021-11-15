Class {
	#name : #AlcixReturn,
	#superclass : #AlcixWithAccesses,
	#instVars : [
		'#invocable => FMOne type: #AlcixInvocable opposite: #returns'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReturn class >> annotation [

	<FMClass: #Return super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReturn >> accept: aVisitor [
	^ aVisitor visitReturn: self

]

{ #category : #visiting }
AlcixReturn >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessReturn: self

]

{ #category : #accessing }
AlcixReturn >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #returns"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixReturn >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixReturn >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #accessing }
AlcixReturn >> userType [
	^ invocable type
]

{ #category : #writing }
AlcixReturn >> writeElement [

	^ { invocable localVariables first }
]
