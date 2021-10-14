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
		  ifTrue: [ {  dueTo } ]
		  ifFalse: [ { dueTo } , wrapped dueToChain ]
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> dueToChainOnlyFst [

	| chain five |
	five := Array new: 6.

	chain := self dueToChain.
	five at: 1 put: chain first.
	five at: 2 put: chain second.
	five at: 3 put: chain third.
	chain := chain reverse.
	five at: 4 put: chain third.
	five at: 5 put: chain second.
	five at: 6 put: chain first.
	^ five
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

	^ self dueToChain reverse second
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
