Class {
	#name : #AlceLookin,
	#superclass : #AlceVisitor,
	#instVars : [
		'match',
		'findings'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLookin >> hasFinding [
	^ findings isNotNil 
]

{ #category : #visiting }
AlceLookin >> visitAccessModule: anAccessModule [
	anAccessModule types do: [ :t | t accept: self ].
	self hasFinding
		ifTrue: [ ^ self ].
	anAccessModule references do: [ :r | r accept: self ]
]

{ #category : #visiting }
AlceLookin >> visitFunction: aFunction [
	match = aFunction selector
		ifTrue: [ self finding: aFunction ]
]

{ #category : #visiting }
AlceLookin >> visitModule: aModule [
	self
		findings: (aModule members detect: [ :m | m name = match ] ifNone: [ nil ])
]
