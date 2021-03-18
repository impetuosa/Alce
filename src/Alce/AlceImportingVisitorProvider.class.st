Class {
	#name : #AlceImportingVisitorProvider,
	#superclass : #Object,
	#instVars : [
		'codeVisitor',
		'databaseVisitor',
		'guiVisitor',
		'controlVisitor',
		'syntaxVisitor',
		'projectVisitor'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #building }
AlceImportingVisitorProvider >> build [
	^ AlceDispatchingImporter new
		code: self codeVisitorInstance;
		database: self databaseVisitorInstance;
		gui: self guiVisitorInstance;
		control: self controlVisitorInstance;
		syntax: self syntaxVisitorInstance;
		project: self projectVisitorInstance;
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
AlceImportingVisitorProvider >> guiVisitorInstance [
	^ self instantiate: guiVisitor
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importGUIElements [
	guiVisitor := AlceGUIImporter
]

{ #category : #configuration }
AlceImportingVisitorProvider >> importProjectElements [
	projectVisitor := AlceProjectImporter
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
AlceImportingVisitorProvider >> syntaxVisitorInstance [
	^ self instantiate: syntaxVisitor
]