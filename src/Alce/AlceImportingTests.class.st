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

{ #category : #running }
AlceImportingTests >> setUp [
	super setUp.
	importer := AlceImporter new.
	
]

{ #category : #running }
AlceImportingTests >> testProjectImporterImportsOnlyProjectAndReferences [
	| model |
	importer provider importProjectElements.
	model := importer import: self class norwind.
	self assert: model isNotEmpty
]
