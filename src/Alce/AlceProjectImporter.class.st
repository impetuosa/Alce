Class {
	#name : #AlceProjectImporter,
	#superclass : #JinProjectVisitor,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitProject: aJinAccessProject [
	self state push: (self instantiate: AlcixAccessModule).
	self state top name: aJinAccessProject name.
	
	
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject relations.
	self visitCollection: aJinAccessProject macros.
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitReference: aJinReference [
	self visitHandleObject: aJinReference
]
