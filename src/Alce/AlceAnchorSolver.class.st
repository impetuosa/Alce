Class {
	#name : #AlceAnchorSolver,
	#superclass : #Object,
	#instVars : [
		'projects',
		'anchors',
		'model'
	],
	#category : #Alce
}

{ #category : #accessing }
AlceAnchorSolver class >> paths [

	^ { 
		  ('Northwind.accdb' -> 'c:\Northwind.accdb' asFileReference).
		  ('magact.accdb' -> 'C:\WMagnus\magact.accdb' asFileReference) }
		  asDictionary
]

{ #category : #solver }
AlceAnchorSolver >> initialize [

	super initialize.
	projects := Dictionary new
]

{ #category : #accessing }
AlceAnchorSolver >> model: anAlcixModel [ 
	model := anAlcixModel
]

{ #category : #'as yet unclassified' }
AlceAnchorSolver >> projectFor: aString [

	| name |
	name := ('.' split: aString) first.

	^ projects at: name asLowercase ifAbsentPut: [ 
		  | reference n |
		  reference := model references detect: [ :r | 
			               r name asLowercase = name asLowercase ].
		  self
			  assert: reference isAccessModule
			  description: 'Trying to open a non access project'.

		  JinAccessApplication default open: reference path asFileReference ]
]

{ #category : #solver }
AlceAnchorSolver >> readEntity: anAlceAnchor andCollect: aFullBlockClosure [

	| project |
	project := self projectFor: anAlceAnchor projectSelector.
	project ensureIsOpen. 
	^ anAlceAnchor readEntityFrom: project andCollect: aFullBlockClosure
]
