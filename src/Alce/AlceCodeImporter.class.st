Class {
	#name : #AlceCodeImporter,
	#superclass : #JinCodeFirstCitizenVisitor,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitFormModule: anObject [
	super visitModule: anObject.

]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitMacro: aMacro [

]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitModule: anObject [
	| obj |
	obj := anObject isClassModule
		ifTrue: [ self instantiate: AlcixClass ]
		ifFalse: [ self instantiate: AlcixModule ].
	obj name: anObject name.
	obj anchor: self state top anchor / #modules / anObject name.
	self state push: obj.
	super visitModule: anObject.
	anObject ensureUnload.
	self state pop
]