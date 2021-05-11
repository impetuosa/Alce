Class {
	#name : #AlceLookin,
	#superclass : #AlceVisitor,
	#instVars : [
		'match',
		'findings'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookin >> findings [
	^ findings
]

{ #category : #'as yet unclassified' }
AlceLookin >> findings: anObject [
	anObject ifNil: [ ^ self ].
	findings := anObject
]

{ #category : #visiting }
AlceLookin >> hasFinding [
	^ findings isNotNil 
]

{ #category : #'as yet unclassified' }
AlceLookin >> match: aString [ 
	match := aString
]

{ #category : #visiting }
AlceLookin >> visitAccessModule: anAccessModule [
	anAccessModule types do: [ :t | t accept: self ].
	self hasFinding
		ifTrue: [ ^ self ].
	anAccessModule references do: [ :r | r accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitClass: anAlcixClass [
	^ self visitModule: anAlcixClass
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitForm: anAlcixForm [
	^ self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceLookin >> visitFunction: aFunction [
	match = aFunction selector
		ifTrue: [ ^ self finding: aFunction ].
	aFunction parameters do: [ :p | p accept: self ].
	aFunction localVariables do: [ :p | p accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitLibrary: anAlcixLibrary [
	^ nil
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitLocalVariable: anAlcixLocalVariable [ 
	anAlcixLocalVariable name = match ifTrue: [ 
		self findings: anAlcixLocalVariable 	
	 ]
]

{ #category : #visiting }
AlceLookin >> visitModule: aModule [
	aModule name = match
		ifTrue: [ ^ self findings: aModule ].
	self
		findings: (aModule members detect: [ :m | m name = match ] ifNone: [ nil ]).
	self
		findings: (aModule types detect: [ :m | m name = match ] ifNone: [ nil ]).
	self
		findings: (aModule invocables detect: [ :m | m selector = match ] ifNone: [ nil ]).
	
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitParameter: anAlcixParameter [
	match = anAlcixParameter name
		ifTrue: [ ^ anAlcixParameter ]
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitReport: anAlcixReport [
	^ self visitForm: anAlcixReport
]

{ #category : #'as yet unclassified' }
AlceLookin >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]
