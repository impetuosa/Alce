Class {
	#name : #AlceImportingSyntactiImporter,
	#superclass : #AlceImporter,
	#category : #'Alce-Tests-Core'
}

{ #category : #'as yet unclassified' }
AlceImportingSyntactiImporter >> importClass: aString named: aName [
	^ self
		importSourceCode: aString
		inTheContextOf: [ :model | 
			| module |
			module := model instantiate: AlcixClass.
			module name: aName.
			module ]
]

{ #category : #'as yet unclassified' }
AlceImportingSyntactiImporter >> importForm: aString named: aName [
	^ self
		importSourceCode: aString
		inTheContextOf: [ :model | 
			| form |
			form := model instantiate: AlcixForm.
			form name: aName.
			form ]
]

{ #category : #'as yet unclassified' }
AlceImportingSyntactiImporter >> importModule: aString named: aName [
	^ self
		importSourceCode: aString
		inTheContextOf: [ :model | 
			| module |
			module := model instantiate: AlcixModule.
			module name: aName.
			module ]
]

{ #category : #'as yet unclassified' }
AlceImportingSyntactiImporter >> importReport: aString named: aName [
	^ self
		importSourceCode: aString
		inTheContextOf: [ :model | 
			| report |
			report := model instantiate: AlcixReport.
			report name: aName.
			report ]
]

{ #category : #'as yet unclassified' }
AlceImportingSyntactiImporter >> importSourceCode: aCode inTheContextOf: aBlock [ 
	| ast visitor model context |
 
	model := AlcixModel new .
	ast := VBParserAPI preparseParse: aCode.
	visitor := self visitorFor: model.
	context := (aBlock value: model).
	context anchor: (AlceAnchor on: #Test).
	visitor state push: context .
	ast acceptVisitor: visitor syntax.
	^ model
]
