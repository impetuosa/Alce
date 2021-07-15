Class {
	#name : #AlceAnchor,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #Alce
}

{ #category : #accessing }
AlceAnchor class >> entryName [

	^ #Anchor
]

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

{ #category : #'as yet unclassified' }
AlceAnchor >> containsSource [

	^ path segments includes: '@src'
]

{ #category : #enumerating }
AlceAnchor >> elementKind [

	self ensureWellformed.
	^ path at: 2
]

{ #category : #enumerating }
AlceAnchor >> elementName [

	self ensureWellformed.
	^ path at: 3
]

{ #category : #enumerating }
AlceAnchor >> ensureWellformed [

	self assert:
		({ 'modules'. 'forms'. 'reports' } includes: (path at: 2))
]

{ #category : #arithmetic }
AlceAnchor >> fullName [
	^ path fullName
]

{ #category : #arithmetic }
AlceAnchor >> hash [
	^ path hash
]

{ #category : #enumerating }
AlceAnchor >> isMooseObject [

	^ true
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
	path size = 3 ifFalse: [ ^ nil ].

	entity := (aProject perform: self elementKind asSymbol) detect: [ :m | 
		          m name = self elementName ].
	val := aFullBlockClosure value: entity.
	entity ensureUnload.
	^ val
]

{ #category : #resolving }
AlceAnchor >> resolve: aProject [
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
AlceAnchor >> srcFrom [

	^ self containsSource
		  ifTrue: [ 
			  (path segments reverse at:
				   (path segments reverse indexOf: '@src') - 1) asNumber ]
		  ifFalse: [ -1 ]
]

{ #category : #'as yet unclassified' }
AlceAnchor >> srcTo [

	^ (path segments reverse at: (path segments reverse  indexOf: #to) - 1) asNumber
]
