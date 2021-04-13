Class {
	#name : #AlceImportingSyntacticTests,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'model'
	],
	#category : #'Alce-Tests'
}

{ #category : #running }
AlceImportingSyntacticTests >> assertLoads: anAmount of: aClass [
	self
		assert: (model select: [ :element | element species =  aClass ]) size
		equals: anAmount
]

{ #category : #running }
AlceImportingSyntacticTests >> setUp [
	super setUp.
	importer := AlceImportingSyntactiImporter new.
	importer provider importSyntacticElements.
]
