Trait {
	#name : #TAlceInvocation,
	#category : #'Alce-Famix-Model'
}

{ #category : #testing }
TAlceInvocation >> becomeFunctionInvocation [

	| n selector sender candidate arguments |
	self assert: (self receiver rightElement isKindOf: AlcixModule).


	selector := self selector.
	sender := self sender.
	candidate := self candidate.
	arguments := self arguments.

	self receiver rightElement: nil.
	self receiver rightElementName: nil.
	self receiver invocable: nil.
	self mooseModel removeEntity: self receiver.
	self sender outgoingInvocations remove: self . 

	self selector: nil.
	self sender: nil.
	self candidate: nil.
	self receiver: nil.
	self arguments asOrderedCollection do: [ :a | a invocation: nil ].

	n := AlcixInvocation new.
	n selector: selector.
	n sender: sender.
	n candidate: candidate.
	n arguments: arguments.

	self mooseModel add: n.
	self mooseModel removeEntity: self
]

{ #category : #testing }
TAlceInvocation >> becomeMethodInvocation [

	| n selector sender candidate arguments access |
	selector := self selector.
	sender := self sender.
	candidate := self candidate.
	arguments := self arguments.
	access := self mooseModel instantiate: AlcixAccessRead.
	access rightElementName: (self variableNameReference: #Me).
	access rightElement: sender userType me.
	access isWriting: false.
	access invocable: sender.
	self sender outgoingInvocations remove: self . 
	
	self selector: nil.
	self sender: nil.
	self candidate: nil.
	self arguments asOrderedCollection do: [ :a | a invocation: nil ].

	n := AlcixMethodInvocation new.
	n selector: selector.
	n sender: sender.
	n candidate: candidate.
	n arguments: arguments.
	n receiver: access.
	self mooseModel add: n.
	self mooseModel removeEntity: self
]

{ #category : #testing }
TAlceInvocation >> isVBMessageSend [
	^ self class = AlcixMethodInvocation
]

{ #category : #testing }
TAlceInvocation >> setCandidate: aCandidate [

	aCandidate ifNil: [ ^ self ].
	((aCandidate isKindOf: AlcixAlias) or: [ 
		 (aCandidate isKindOf: AlcixClass) or: [ 
			 aCandidate isKindOf: AlcixParameter ] ]) ifTrue: [ ^ self ].
	(aCandidate isKindOf: AlcixVariable) ifTrue: [ 
		^ self becomeReadingAccessWithCandidate: aCandidate ].

	self candidate: aCandidate.


	(self isVBMessageSend and: [ aCandidate isMethod not ]) ifTrue: [ 
		self receiver rightElement ifNil: [ ^ self candidate: nil ].
		self becomeFunctionInvocation ].
	(self isVBMessageSend not and: [ aCandidate isMethod ]) ifTrue: [ 
		self becomeMethodInvocation ]
]
