Class {
	#name : #AlceTextSegmentAnchor,
	#superclass : #AlceAnchor,
	#instVars : [
		'from',
		'to'
	],
	#category : #Alce
}

{ #category : #accessing }
AlceTextSegmentAnchor >> = anOtherAnchor [
	^ super = anOtherAnchor
		and: [ to = anOtherAnchor to and: [ from = anOtherAnchor from ] ]
]

{ #category : #accessing }
AlceTextSegmentAnchor >> from [
	^ from
]

{ #category : #accessing }
AlceTextSegmentAnchor >> from: aNumber [
	from := aNumber
]

{ #category : #accessing }
AlceTextSegmentAnchor >> hash [
	^ (super hash bitXor: to hash) bitXor: from hash
]

{ #category : #accessing }
AlceTextSegmentAnchor >> to [
	^ to
]

{ #category : #accessing }
AlceTextSegmentAnchor >> to: aNumber [
	to := aNumber
]
