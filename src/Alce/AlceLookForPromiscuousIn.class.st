Class {
	#name : #AlceLookForPromiscuousIn,
	#superclass : #AlceLookIn,
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookForPromiscuousIn >> lookInto: aNode [
	| entities | 
	entities :=	( aNode mooseModel select: [ : a | self matches: a name ]).
	entities ifNotEmpty: [ self halt  ].
^ self findings: entities first 
]
