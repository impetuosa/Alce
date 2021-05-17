Class {
	#name : #AlceLookIn,
	#superclass : #AlceLook,
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookIn >> lookInto: aNode [

	^ aNode accept: self
]

{ #category : #testing }
AlceLookIn >> matches: aString [
	^ (match compare: aString caseSensitive: false) = 2
]

{ #category : #visiting }
AlceLookIn >> visitAccessModule: anAccessModule [

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
	
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLibrary: anAlcixLibrary [

]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLocalVariable: anAlcixLocalVariable [ 

]

{ #category : #visiting }
AlceLookIn >> visitModule: aModule [

]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitParameter: anAlcixParameter [
	
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitReport: anAlcixReport [
	^ self visitForm: anAlcixReport
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]
