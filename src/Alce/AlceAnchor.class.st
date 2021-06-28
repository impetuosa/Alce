Class {
	#name : #AlceAnchor,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #Alce
}

{ #category : #'as yet unclassified' }
AlceAnchor class >> on: aString [
	^ self new privateSetPath: (AbsolutePath from: aString)
]

{ #category : #arithmetic }
AlceAnchor >> / aString [
	| new |
	new := self class new.
	
	new privateSetPath: path / aString adaptToAlceAnchorPathFragment  . 
	^ new 
]

{ #category : #arithmetic }
AlceAnchor >> = anOtherAnchor [
	self species = anOtherAnchor species
		ifFalse: [ ^ false ].
	^ path = anOtherAnchor privateGetPath
]

{ #category : #arithmetic }
AlceAnchor >> basename [
	^ path basename
]

{ #category : #arithmetic }
AlceAnchor >> fullName [
	^ path fullName
]

{ #category : #arithmetic }
AlceAnchor >> hash [
	^ path hash
]

{ #category : #arithmetic }
AlceAnchor >> privateGetPath [
	^ path
]

{ #category : #arithmetic }
AlceAnchor >> privateSetPath: aPath [
	path := aPath
]

{ #category : #'as yet unclassified' }
AlceAnchor >> projectSelector [

	^ path at: 1
]

{ #category : #enumerating }
AlceAnchor >> readEntityFrom: aProject andCollect: aFullBlockClosure [

	| val entity |
	
	
	 path size = 3 ifFalse: [ ^ nil  ].
	self assert: ({'modules' . 'forms' . 'reports' } includes: (path at: 2)).
	entity := (aProject perform: (path at: 2) asSymbol) detect: [ :m | 
		          m name = (path at: 3) ].
	val := aFullBlockClosure value: entity.
	entity ensureUnload.
	^ val
]

{ #category : #resolving }
AlceAnchor >> resolve: aProject [
	self shouldBeImplemented
]
