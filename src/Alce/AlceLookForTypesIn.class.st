Class {
	#name : #AlceLookForTypesIn,
	#superclass : #AlceLookIn,
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLookForTypesIn >> visitAccessModule: anAccessModule [
	anAccessModule types do: [ :t | t accept: self ].
	anAccessModule references do: [ :r | r accept: self ]
]

{ #category : #visiting }
AlceLookForTypesIn >> visitClass: anAlcixClass [
	(self matches: anAlcixClass name)
		ifTrue: [ self findings: anAlcixClass ]
		ifFalse: [ super visitClass: anAlcixClass ]
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
