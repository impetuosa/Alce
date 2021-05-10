Class {
	#name : #AlceLookIn,
	#superclass : #AlceLook,
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLookIn >> visitAccessModule: anAccessModule [
	anAccessModule types do: [ :t | t accept: self ].
	self hasFinding
		ifTrue: [ ^ self ].
	anAccessModule references do: [ :r | r accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitClass: anAlcixClass [
	^ self visitModule: anAlcixClass
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitForm: anAlcixForm [
	^ self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceLookIn >> visitFunction: aFunction [
	match = aFunction selector
		ifTrue: [ ^ self findings: aFunction ].
	aFunction parameters do: [ :p | p accept: self ].
	aFunction localVariables do: [ :p | p accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLibrary: anAlcixLibrary [
	^ nil
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLocalVariable: anAlcixLocalVariable [ 
	anAlcixLocalVariable name = match ifTrue: [ 
		self findings: anAlcixLocalVariable 	
	 ]
]

{ #category : #visiting }
AlceLookIn >> visitModule: aModule [
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
AlceLookIn >> visitParameter: anAlcixParameter [
	match = anAlcixParameter name
		ifTrue: [ ^ anAlcixParameter ]
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitReport: anAlcixReport [
	^ self visitForm: anAlcixReport
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]
