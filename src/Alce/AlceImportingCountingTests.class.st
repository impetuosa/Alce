Class {
	#name : #AlceImportingCountingTests,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'building suites' }
AlceImportingCountingTests class >> norwind [
	^ 'c:\Northwind.accdb' asFileReference
]

{ #category : #helpers }
AlceImportingCountingTests >> assertModel: model allAnchorsOfClass: aClass satisfy: aBlock [
	self
		assert:
			((model select: [ :element | element isKindOf: aClass ])
				allSatisfy: [ :e | aBlock cull: e cull: e anchor ])
]

{ #category : #helpers }
AlceImportingCountingTests >> assertModel: model loads: anAmount of: aClass [
	self
		assert: (model select: [ :element | element species =  aClass ]) size
		equals: anAmount
]

{ #category : #helpers }
AlceImportingCountingTests >> runCaseManaged [
	self runCase
]

{ #category : #'project level import' }
AlceImportingCountingTests >> setUp [
	super setUp.
	importer := AlceImporter new.
	
]

{ #category : #'code elements import' }
AlceImportingCountingTests >> testCodeImporterImportsModulesClassesFormsAndReports [
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
AlceImportingCountingTests >> testGuiImporterImportsGraphicalControlsAnchorsElements [
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
AlceImportingCountingTests >> testGuiImporterImportsMainGraphicalAnchorsElements [
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
AlceImportingCountingTests >> testGuiImporterImportsMainGraphicalControlElements [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 1086 of: AlcixAttribute.

]

{ #category : #'gui element import' }
AlceImportingCountingTests >> testGuiImporterImportsMainGraphicalElements [
	| model |
	importer provider importProjectElements; importGUIElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 35 of: AlcixForm.
	self assertModel: model loads: 15 of: AlcixReport.

]

{ #category : #'project level import' }
AlceImportingCountingTests >> testProjectImporterImportsOnlyOne [
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
AlceImportingCountingTests >> testProjectImporterImportsReferences [
	| model |
	importer provider importProjectElements.
	model := importer import: self class norwind.
	self assertModel: model loads: 6 of: AlcixLibrary.
	self
		assertModel: model
		allAnchorsOfClass: AlcixLibrary
		satisfy: [ :e :a | a fullName = ('/references/' , e name) ]
]

{ #category : #'code elements import' }
AlceImportingCountingTests >> testSyntacticCodeImporterImportsModulesClassesFormsAndReports [
	| model |
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importSyntacticElements.
	model := importer import: self class norwind.
	model inspect.
	self assertModel: model loads: 269 of: AlcixInvocation.
	self assertModel: model loads: 127 of: AlcixMethodInvocation .
	self assertModel: model loads: 0 of: AlcixRaiseEvent.
	self assertModel: model loads: 707 of: AlcixAccess.
	self assertModel: model loads: 2 of: AlcixClass.
	self assertModel: model loads: 7 of: AlcixModule.
	self assertModel: model loads: 81 of: AlcixFunction.
	self assertModel: model loads: 0 of: AlcixExternalFunction.
	self assertModel: model loads: 51 of: AlcixSubProcedure.
	self assertModel: model loads: 0 of: AlcixExternalSubProcedure.
	self assertModel: model loads: 1096 of: AlcixAttribute.
	self assertModel: model loads: 2 of: AlcixAttributeAccessor.
	self assertModel: model loads: 8 of: AlcixEnum.
	self assertModel: model loads: 90 of: AlcixEnumValue.
	self assertModel: model loads: 1 of: AlcixUserType.
	self assertModel: model loads: 57 of: AlcixLocalVariable
]
