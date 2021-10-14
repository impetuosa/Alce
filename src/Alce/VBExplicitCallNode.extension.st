Extension { #name : #VBExplicitCallNode }

{ #category : #'*alce' }
VBExplicitCallNode >> arguments [
	^ selector isIdentifier ifTrue: [ nil ] ifFalse: [ selector arguments  ]
]
