Class {
	#name : #AlceStats,
	#superclass : #AlceVisitor,
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceStats >> computeStatsFor: aLinkedModel [
	self resetCounters.
	aLinkedModel accept: self
]
