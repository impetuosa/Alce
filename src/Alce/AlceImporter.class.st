Class {
	#name : #AlceImporter,
	#superclass : #Object,
	#instVars : [
		'provider',
		'symbolTable'
	],
	#category : #'Alce-Importer'
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
AlceImporter >> import: aProjectPath symbolTableAt: aString [

	| symbolTableBuilder project |
	aString asFileReference exists
		ifTrue: [ 
		symbolTable := JinNSSymbolTable loadFrom: aString asFileReference ]
		ifFalse: [ 
			project := JinAccessApplication default open: aProjectPath.
			symbolTableBuilder := JinNSBuilder new.
			symbolTable := symbolTableBuilder buildFor: project.
			symbolTable saveAs: aString asFileReference.
			project closeAndQuit ].
	^ self import: aProjectPath
]

{ #category : #accessing }
AlceImporter >> initialize [
	super initialize.
	provider := AlceImportingVisitorProvider new 
]

{ #category : #accessing }
AlceImporter >> provider [
	^ provider
]

{ #category : #accessing }
AlceImporter >> visitorFor: aModel [

	^ self createDefaultVisitor
		  model: aModel;
		  symbolTable: symbolTable;
		  yourself
]
