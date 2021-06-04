Class {
	#name : #AlceStats,
	#superclass : #AlceVisitor,
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceStats >> computeStatsFor: aLinkedModel [
	self resetCounters.
	aLinkedModel accept: self
]
