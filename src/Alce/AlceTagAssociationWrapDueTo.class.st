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
AlceTagAssociationWrapDueTo >> beforeLastLink [

	^ (wrapped wrapped isKindOf: FamixTagAssociation)
		  ifTrue: [ dueTo ]
		  ifFalse: [ wrapped beforeLastLink ]
]

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
		  ifTrue: [ { dueTo } ]
		  ifFalse: [ { dueTo } , wrapped dueToChain ]
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> dueToChainOnlyFst [

	| inn five |
	five := Array new: 6.

	inn := self dueToChain.
	five at: 1 put: inn first.
	five at: 2 put: inn second.
	five at: 3 put: inn third.
	inn := inn reverse.
	five at: 4 put: inn third.
	five at: 5 put: inn second.
	five at: 6 put: inn first.
	^ five
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> entity [

	^ wrapped entity
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> firstLink [

	^ dueTo
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> lastLeftDueTo [

	^ self dueToChain second
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> lastLink [

	^ (wrapped isKindOf: FamixTagAssociation)
		  ifTrue: [ dueTo ]
		  ifFalse: [ wrapped lastLink ]
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> name [
	^ self tag name 
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> penultimateDueTo [

	| dt |
	dt := self dueToChain.
	dt size >= 2 ifTrue: [ dt reverse second ].
	^ dueTo
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> printOn: aStream [
	aStream nextPutAll: dueTo name; nextPutAll: '.'.
	wrapped printOn: aStream 
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> secondLink [

	^ wrapped dueTo
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> tag [
	^ wrapped tag
]

{ #category : #'as yet unclassified' }
AlceTagAssociationWrapDueTo >> thirdLink [

	^ wrapped wrapped dueTo
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> wrapped [
	^ wrapped
]

{ #category : #accessing }
AlceTagAssociationWrapDueTo >> wrapped: aTagAssocOrWrapper [

	wrapped := aTagAssocOrWrapper
]
