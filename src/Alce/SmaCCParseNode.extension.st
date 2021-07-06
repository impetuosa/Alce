Extension { #name : #SmaCCParseNode }

{ #category : #'*Alce' }
SmaCCParseNode >> allNodesSelect: aBlock [

	| collection |
	collection := OrderedCollection new.
	self allNodesDo: [ :n | 
		(aBlock value: n) ifTrue: [ collection add: n ] ].
	^ collection
]
