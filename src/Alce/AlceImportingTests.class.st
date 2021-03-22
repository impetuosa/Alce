Class {
	#name : #AlceImportingTests,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'Alce-Tests'
}

{ #category : #'building suites' }
AlceImportingTests class >> norwind [
	^ 'c:\Northwind.accdb' asFileReference
]

{ #category : #helpers }
AlceImportingTests >> assertModel: model allAnchorsOfClass: aClass satisfy: aBlock [
	self
		assert:
			((model select: [ :element | element isKindOf: aClass ])
				allSatisfy: [ :e | aBlock cull: e cull: e anchor ])
]

{ #category : #helpers }
AlceImportingTests >> assertModel: model loads: anAmount of: aClass [
	self
		assert: (model select: [ :element | element isKindOf: aClass ]) size
		equals: anAmount
]

{ #category : #helpers }
AlceImportingTests >> runCaseManaged [
	self runCase
]

{ #category : #'project level import' }
AlceImportingTests >> setUp [
	super setUp.
	importer := AlceImporter new.
	
]

{ #category : #'code elements import' }
AlceImportingTests >> testCodeImporterImportsModulesClassesFormsAndReports [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 7 of: AlcixModule.
	self assertModel: model loads: 2 of: AlcixClass
]

{ #category : #'gui control import' }
AlceImportingTests >> testGuiImporterImportsGraphicalControlsAnchorsElements [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements.
	model := importer import: self class norwind.
	self
		assertModel: model
		allAnchorsOfClass: AlcixAttribute
		satisfy: [ :e :a | a fullName endsWith: '/controls/' , e name ]
]

{ #category : #'gui element import' }
AlceImportingTests >> testGuiImporterImportsMainGraphicalAnchorsElements [
	| model |
	importer provider
		importProjectElements;
		importGUIElements.
	model := importer import: self class norwind.
	self
		assertModel: model
		allAnchorsOfClass: AlcixForm
		satisfy: [ :e :a | a fullName = ('/forms/' , e name) ].
	self
		assertModel: model
		allAnchorsOfClass: AlcixReport
		satisfy: [ :e :a | a fullName = ('/reports/' , e name) ]
]

{ #category : #'gui control import' }
AlceImportingTests >> testGuiImporterImportsMainGraphicalControlElements [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 1086 of: AlcixAttribute.

]

{ #category : #'gui element import' }
AlceImportingTests >> testGuiImporterImportsMainGraphicalElements [
	| model |
	importer provider importProjectElements; importGUIElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 34 of: AlcixForm.
	self assertModel: model loads: 15 of: AlcixReport.

]

{ #category : #'project level import' }
AlceImportingTests >> testProjectImporterImportsOnlyOne [
	| model |
	importer provider importProjectElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 1 of: AlcixAccessModule.
	self
		assertModel: model
		allAnchorsOfClass: AlcixAccessModule
		satisfy: [ :e :a | a fullName = '/' ]
]

{ #category : #'project level import' }
AlceImportingTests >> testProjectImporterImportsReferences [
	| model |
	importer provider importProjectElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 4 of: AlcixLibrary.
	self
		assertModel: model
		allAnchorsOfClass: AlcixLibrary
		satisfy: [ :e :a | a fullName = ('/references/' , e name) ]
]

{ #category : #'code elements import' }
AlceImportingTests >> testSyntacticCodeImporterImportsModulesClassesFormsAndReports [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importSyntacticElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 10 of: AlcixClass.
	self assertModel: model loads: 10 of: AlcixModule.
	self assertModel: model loads: 10 of: AlcixFunction.
	self assertModel: model loads: 10 of: AlcixSubProcedure
]
