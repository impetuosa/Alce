Class {
	#name : #AlceProjectImporter,
	#superclass : #JinProjectVisitor,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitProject: aJinAccessProject [
	self state push: (self instantiate: AlcixAccessModule).
	self state top name: aJinAccessProject name.
	self state top anchor: (AlceAnchor on: #/).
	self state top addReference: self sdkLibrary.
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject relations.
	self visitCollection: aJinAccessProject macros
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitReference: aJinReference [
	| ref |
	aJinReference path extension asLowercase = 'accdb'
		ifTrue: [ ref := self instantiate: AlcixAccessModule ]
		ifFalse: [ ref := self instantiate: AlcixLibrary.
			ref isBuiltIn: aJinReference isBuiltIn ].
	ref anchor: self state top anchor / #references / aJinReference name.
	ref path: aJinReference path fullName.
	ref name: aJinReference name.
	self state top addReference: ref
]
