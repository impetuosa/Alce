Class {
	#name : #AlceImporter,
	#superclass : #Object,
	#instVars : [
		'application'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #accessing }
AlceImporter >> import: aProjectPath [
	application := JinAccessApplication default open: aProjectPath.
	
]
