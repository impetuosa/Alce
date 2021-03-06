Class {
	#name : #AlceNorthwindReportSyntacticCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest class >> setupReportMonthlySalesReport_Open [
^ {
(#setup -> #setupReportMonthlySales).
	(#fixture
		->
			{(#functionOrSub -> #Report_Open ).
			(#assignments -> 12).
			(#outgoingInvocations -> 6).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest class >> setupReportQuarterlySalesReport_Open [
^ {
(#setup -> #setupReportQuarterlySales).
	(#fixture
		->
			{(#functionOrSub -> #Report_Open).
			(#assignments -> 12).
			(#outgoingInvocations -> 7).
			(#localVariables -> 4).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest class >> setupReportYearlySalesReport_Open [
^ {
(#setup -> #setupReportYearlySales).
	(#fixture
		->
			{(#functionOrSub -> #Report_Open).
			(#assignments -> 9).
			(#outgoingInvocations -> 5).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'building suites' }
AlceNorthwindReportSyntacticCountingTest class >> testParameters [
	^ super testParameters
		addCase: self setupReportMonthlySalesReport_Open;
		addCase: self setupReportQuarterlySalesReport_Open;
		addCase: self setupReportYearlySalesReport_Open
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"

"	actual = expected
		ifFalse: [ (self class class methods
				detect: [ :m | 
					| sc |
					sc := m sourceCode.
					(sc includesSubstring: setup)
						and: [ sc includesSubstring: '#' , (fixture at: #functionOrSub) ] ])
				browse ]."
	^ self
		assert: actual = expected
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> assertIfFunction: aBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^ self skip ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | 
			(a typeName isKindOf: AlcixTypeReference)
				and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | 
			((a rightElementName isKindOf: AlcixReferenceName)
				and: [ a rightElementName isNotEmpty ]) or: [ a isWriting ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isKindOf: AlcixInvocableReference  ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionHasParameters [
	self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		do: [ :p :pt | self assert: p typeName stringName equals: pt ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | 
			(p typeName isKindOf: AlcixTypeReference)
				and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinedFunctionReturnsBoolean [
	self
		assertIfFunction: [ self
				assert: self functionOrSub typeName stringName
				equals: (fixture at: #return).
			true ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testFunctionReturnsType [
	self
		assertIfFunction: [ self functionOrSub typeName isKindOf: AlcixTypeReference ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			self
				assert:
					(inv isVBMessageSend = inv selector selectorSeemsToBeMethodInvocation
						or: [ inv isVBMessageSend
								and: [ inv receiver rightElementName names first = #Me ] ]) ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver class equals: AlcixAccessRead ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testMethodInvocationMustHaveAPointAndOthersMustHaveNotPoint [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver rightElementName isNotEmpty.
					self
						assert:
							(inv selector selectorSeemsToBeMethodInvocation
								or: [ inv receiver rightElementName names first = #Me ]) ]
				ifFalse: [ self deny: inv selector selectorSeemsToBeMethodInvocation ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticCountingTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self
						assert:
							(inv receiver rightElementName names last
								endsWith: inv selector names last) ]
				ifFalse: [ self deny: inv selector selectorSeemsToBeMethodInvocation ] ]
]
