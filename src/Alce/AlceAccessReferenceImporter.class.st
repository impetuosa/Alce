Class {
	#name : #AlceAccessReferenceImporter,
	#superclass : #JinAccessReferenceVisitor,
	#category : #'Alce-Importer'
}

{ #category : #visiting }
AlceAccessReferenceImporter >> visitReference: anAccessModule [
	| project |
	project := JinAccessApplication default open:
		           anAccessModule path asFileReference.

	project acceptVisitor: self.
	project closeAndQuit
]
