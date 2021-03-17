Class {
	#name : #AlceImporter,
	#superclass : #Object,
	#instVars : [
		'provider'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #accessing }
AlceImporter >> createDefaultVisitor [
	^ provider build
]

{ #category : #accessing }
AlceImporter >> import: aProjectPath [
	^ self import: aProjectPath into: AlcixModel new
]

{ #category : #accessing }
AlceImporter >> import: aProjectPath into: aModel [
	| project visitor |
	project := JinAccessApplication default open: aProjectPath.
	visitor := self visitorFor: aModel.
	[ project acceptVisitor: visitor.
	^ aModel ]
		ensure: [ project closeAndQuit ]
]

{ #category : #accessing }
AlceImporter >> initialize [
	super initialize.
	provider := AlceImportingVisitorProvider
]

{ #category : #accessing }
AlceImporter >> provider [
	^ provider
]

{ #category : #accessing }
AlceImporter >> visitorFor: aModel [
	^ self createDefaultVisitor
		model: aModel;
		yourself
]
