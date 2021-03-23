Class {
	#name : #AlcixGlobalVariable,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#module => FMOne type: #AlcixModule opposite: #globalVariables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixGlobalVariable >> module [
	"Relation named: #module type: #AlcixModule opposite: #globalVariables"

	<generated>
	<container>
	^ module
]

{ #category : #accessing }
AlcixGlobalVariable >> module: anObject [

	<generated>
	module := anObject
]

{ #category : #navigation }
AlcixGlobalVariable >> moduleGroup [
	<generated>
	<navigation: 'Module'>
	^ MooseSpecializedGroup with: self module
]
