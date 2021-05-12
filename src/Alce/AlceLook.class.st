Class {
	#name : #AlceLook,
	#superclass : #AlceVisitor,
	#instVars : [
		'match',
		'findings'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLook >> findings [
	^ findings
]

{ #category : #visiting }
AlceLook >> findings: anObject [
	anObject ifNil: [ ^ self ].
	findings := anObject
]

{ #category : #visiting }
AlceLook >> hasFinding [
	^ findings isNotNil 
]

{ #category : #visiting }
AlceLook >> match: aMatch [
 	match := aMatch 
]
