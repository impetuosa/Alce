Class {
	#name : #AlceReferenceGatherer,
	#superclass : #Object,
	#instVars : [
		'references'
	],
	#category : #'Alce-Generator'
}

{ #category : #adding }
AlceReferenceGatherer >> addReference: anAlceIXAccess [ 
	self references add: anAlceIXAccess 
]

{ #category : #accessing }
AlceReferenceGatherer >> references [
	^references ifNil: [ references := OrderedCollection new  ]
]
