Class {
	#name : #AlceLibraryReferenceImporter,
	#superclass : #JinLibraryReferenceVisitor,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'visit-first-objects' }
AlceLibraryReferenceImporter >> visitReference: aReference [ 
	aReference library accept: self 
]
