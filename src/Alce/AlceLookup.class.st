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
AlceLookup >> findings: anObject [
	anObject ifNil: [ ^ self ].
	findings := anObject
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

{ #category : #'as yet unclassified' }
AlceLookup >> visitAttribute: anAlcixAttribute [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
AlceLookup >> visitClass: anAlcixClass [ 
	self visitModule: anAlcixClass 
]

{ #category : #visiting }
AlceLookup >> visitFunction: aFunction [
	self lookIn: aFunction or: [ aFunction module accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookup >> visitMethodInvocation: anAlcixMethodInvocation [
	anAlcixMethodInvocation invocable accept: self
]

{ #category : #visiting }
AlceLookup >> visitModule: anModule [
	self lookIn: anModule or: [ anModule container accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookup >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]

{ #category : #visiting }
AlceLookup >> visitTypedEntity: aTypedEntity [
	^ aTypedEntity userType accept: self
]

{ #category : #'as yet unclassified' }
AlceLookup >> visitUserType: anAlcixUserType [ 

]
