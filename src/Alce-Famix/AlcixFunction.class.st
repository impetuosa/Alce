Class {
	#name : #AlcixFunction,
	#superclass : #AlcixInvocable,
	#instVars : [
		'#type => FMOne type: #AlcixTType opposite: #function'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixFunction class >> annotation [

	<FMClass: #Function super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixFunction >> type [
	"Relation named: #type type: #AlcixTType opposite: #function"

	<generated>
	^ type
]

{ #category : #accessing }
AlcixFunction >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
AlcixFunction >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
