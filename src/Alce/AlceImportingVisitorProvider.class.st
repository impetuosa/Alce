Class {
	#name : #AlceImportingVisitorProvider,
	#superclass : #Object,
	#instVars : [
		'codeVisitor',
		'databaseVisitor',
		'guiVisitor',
		'controlVisitor',
		'syntaxVisitor',
		'projectVisitor',
		'filter',
		'referenceAccessVisitor',
		'referenceLibraryVisitor',
		'savingPhases'
	],
	#category : #'Alce-Importer-Construction'
}

{ #category : #building }
AlceImportingVisitorProvider >> build [

	^ AlceDispatchingImporter new
		  savingPhases: self savingPhases;
		  code: self codeVisitorInstance;
		  database: self databaseVisitorInstance;
		  gui: self guiVisitorInstance;
		  control: self controlVisitorInstance;
		  syntax: self syntaxVisitorInstance;
		  project: self projectVisitorInstance;
		  referenceAccess: self referenceAccessVisitorInstance;
		  referenceLibrary: self referenceLibraryVisitorInstance;
		  yourself
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> codeVisitorInstance [
	^ self instantiate: codeVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> controlVisitorInstance [
	^ self instantiate: controlVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> databaseVisitorInstance [
	^ self instantiate: databaseVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> filtering: aBlock [
	filter := aBlock
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> guiVisitorInstance [
	^ self instantiate: guiVisitor
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importAccessReferences [

	referenceAccessVisitor := AlceAccessReferenceImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importCodeElements [
	codeVisitor := AlceCodeImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importGUIControlElements [
	controlVisitor := AlceGUIControlImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importGUIElements [
	guiVisitor := AlceGUIImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importLibraryReferences [
	referenceLibraryVisitor := AlceLibraryReferenceImporter 
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importProjectElements [
	projectVisitor := AlceProjectImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importSyntacticElements [
	syntaxVisitor := AlceASTCodeImporter
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> instantiate: aClassOrNil [
	^ aClassOrNil ifNotNil: [ aClassOrNil new ] 
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> projectVisitorInstance [
	^ self instantiate: projectVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> referenceAccessVisitorInstance [ 
	^ self instantiate: referenceAccessVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> referenceLibraryVisitorInstance [ 
	^ self instantiate: referenceLibraryVisitor
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> savingPhases [

	^ savingPhases ifNil: [ false ]
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> savingPhases: aBool [

	savingPhases := aBool
]

{ #category : #'instantiate parts' }
AlceImportingVisitorProvider >> syntaxVisitorInstance [
	^ self instantiate: syntaxVisitor
]
