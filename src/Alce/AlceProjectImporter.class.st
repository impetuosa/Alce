Class {
	#name : #AlceProjectImporter,
	#superclass : #JinProjectVisitor,
	#category : #'Alce-Importer'
}

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitCollectionBlock: aCollectionBlock reseting: aProject [ 

	| batch |
	batch := aCollectionBlock value size / 5.

	1 to: batch do: [ :i | 
		aProject reopen.
		i to: (i + 5 min: aCollectionBlock value size) do: [ :e | 
		(aCollectionBlock value at: e) acceptVisitor: self ].
	 ]
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitProject: aJinAccessProject [

	self state push: (self instantiate: AlcixAccessModule).
	self state top name: aJinAccessProject name.
	self state top anchor: (AlceAnchor on: #/).
	self state top addReference: self sdkLibrary.

	self visitCollection: aJinAccessProject modules.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject reports.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject forms.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject references.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject tables.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject queries.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject relations.
	self halt.
	aJinAccessProject reopen.
	self visitCollection: aJinAccessProject macros
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitReference: aJinReference [

	| ref |
	aJinReference isAccessProject
		ifTrue: [ ref := self instantiate: AlcixAccessModule ]
		ifFalse: [ 
			ref := self instantiate: AlcixLibrary.
			ref isBuiltIn: aJinReference isBuiltIn ].
	ref anchor: self state top anchor / #references / aJinReference name.
	ref path: aJinReference path fullName.
	ref name: aJinReference name.
	self state top addReference: ref.
	self state push: ref.
	aJinReference isAccessProject
		ifTrue: [ 
			self referenceAccess ifNotNil: [ :r | 
				r visitReference: aJinReference ] ]
		ifFalse: [ 
			self referenceLibrary ifNotNil: [ :r | 
				r visitReference: aJinReference ] ].
	self state pop
]
