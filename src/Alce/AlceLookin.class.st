Class {
	#name : #AlceLookIn,
	#superclass : #AlceLook,
	#category : #'Alce-Importer-Linker'
}

{ #category : #visiting }
AlceLookIn >> visitAccessModule: anAccessModule [
	anAccessModule types do: [ :t | t accept: self ].
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
	aFunction parameters do: [ :p | p accept: self ].
	aFunction localVariables do: [ :p | p accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLookIn >> visitLibrary: anAlcixLibrary [
	^ nil
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
