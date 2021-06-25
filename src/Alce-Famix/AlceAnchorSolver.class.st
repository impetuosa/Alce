Class {
	#name : #AlceAnchorSolver,
	#superclass : #Object,
	#instVars : [
		'projects',
		'anchors'
	],
	#category : #'Alce-Famix-Model'
}

{ #category : #accessing }
AlceAnchorSolver class >> paths [

	^ { ('Northwind.accdb' -> 'c:\Northwind.accdb' asFileReference) }
		  asDictionary
]

{ #category : #solver }
AlceAnchorSolver >> initialize [

	super initialize.
	projects := Dictionary new
]

{ #category : #'as yet unclassified' }
AlceAnchorSolver >> projectFor: aString [

	^ projects
		  at: aString
		  ifAbsentPut: [ 
		  JinAccessApplication default open: (self class paths at: aString) ]
]

{ #category : #solver }
AlceAnchorSolver >> readEntity: anAlceAnchor andCollect: aFullBlockClosure [

	| project |
	project := self projectFor: anAlceAnchor projectSelector.
	^ anAlceAnchor readEntityFrom: project andCollect: aFullBlockClosure
]
