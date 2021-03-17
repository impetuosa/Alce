Class {
	#name : #AlceDispatchingImporter,
	#superclass : #JinSingleInstanceDispatchVisitor,
	#instVars : [
		'model'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'instance creation' }
AlceDispatchingImporter >> initialize [
	super initialize.
	state := Stack new.
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> instantiate: aClass [
	^ model instantiate: aClass
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> model: aModel [
	model := aModel
]
