Class {
	#name : #AlceLibraryReferenceImporter,
	#superclass : #JinLibraryReferenceVisitor,
	#category : #'Alce-Importer'
}

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitFunction: aJinLibraryFunction [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibrary: aJinLibrary [

	self visitCollection: aJinLibrary functions.
	self visitCollection: aJinLibrary types .
]

{ #category : #'visit-first-objects' }
AlceLibraryReferenceImporter >> visitReference: aReference [ 
	aReference library accept: self 
]
