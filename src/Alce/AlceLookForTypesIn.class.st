Class {
	#name : #AlceLookForTypesIn,
	#superclass : #AlceLookIn,
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookForTypesIn >> matchesFormNamed: aString [
	^ match refersToFormNamed: aString
]

{ #category : #visiting }
AlceLookForTypesIn >> visitAccessModule: anAccessModule [
	self visitCollection: anAccessModule types.
	self visitCollection: anAccessModule references
]

{ #category : #visiting }
AlceLookForTypesIn >> visitClass: anAlcixClass [
	(self matches: anAlcixClass name)
		ifTrue: [ self findings: anAlcixClass ]
		ifFalse: [ super visitClass: anAlcixClass ]
]

{ #category : #visiting }
AlceLookForTypesIn >> visitForm: anAlcixForm [
	super visitForm: anAlcixForm.
	self hasFinding
		ifTrue: [ ^ self ].
	(self matchesFormNamed: anAlcixForm name)
		ifTrue: [ self findings: anAlcixForm ]
]

{ #category : #visiting }
AlceLookForTypesIn >> visitLibrary: aLibrary [

	aLibrary types do: [ :t | 
		(self matches: t name) ifTrue: [ ^ self findings: t ] ]
]

{ #category : #visiting }
AlceLookForTypesIn >> visitModule: aModule [

	aModule types do: [ :t | 
		(self matches: t name) ifTrue: [ ^ self findings: t ] ]
]
