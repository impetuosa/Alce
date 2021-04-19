Class {
	#name : #AlceLookup,
	#superclass : #AlceVisitor,
	#instVars : [
		'match',
		'findings'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookup class >> lookFor: aMatch from: aNode [
	| instance |
	instance := self new.
	instance match: aMatch.
	aNode accept: instance.
	^ instance findings
]

{ #category : #visiting }
AlceLookup >> findings [
	^ findings
]

{ #category : #visiting }
AlceLookup >> findings: aFindign [
	findings := aFindign
]

{ #category : #visiting }
AlceLookup >> lookIn: aNode or: aBlock [
	| lookin |
	lookin := AlceLookin new
		match: match;
		yourself.
	aNode accept: lookin.
	lookin findings
		ifNil: [ aBlock value ]
		ifNotNil: [ :f | self findings: f ]
]

{ #category : #visiting }
AlceLookup >> match: aMatch [
 	match := aMatch 
]

{ #category : #visiting }
AlceLookup >> visitAccessModule: anAccessModule [
	self lookIn: anAccessModule or: [ " nothing to do " ]
]

{ #category : #visiting }
AlceLookup >> visitFunction: aFunction [
	self lookIn: aFunction or: [ aFunction module accept: self ]
]

{ #category : #visiting }
AlceLookup >> visitModule: anModule [
	self lookIn: anModule or: [ anModule container accept: self ]
]

{ #category : #visiting }
AlceLookup >> visitTypedEntity: aTypedEntity [
	^ aTypedEntity userType accept: self
]
