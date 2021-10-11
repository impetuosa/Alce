Class {
	#name : #AlceTagAssociationWrapDueTo,
	#superclass : #Object,
	#instVars : [
		'wrapped',
		'dueTo'
	],
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> dueTo [

	^ dueTo
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> dueTo: anEntity [

	dueTo := anEntity
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> dueToChain [

	^ (wrapped isKindOf: FamixTagAssociation)
		  ifTrue: [ {  } ]
		  ifFalse: [ { dueTo } , wrapped dueToChain ]
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> entity [

	^ wrapped entity
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> lastLeftDueTo [

	^ self dueToChain second
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> penultimateDueTo [

	^ self dueToChain reverse first
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> printOn: aStream [
	aStream nextPutAll: dueTo name; nextPutAll: '.'.
	wrapped printOn: aStream 
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> tag [
	^ wrapped tag
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> wrapped [
	^ wrapped
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> wrapped: aTagAssocOrWrapper [

	wrapped := aTagAssocOrWrapper
]
