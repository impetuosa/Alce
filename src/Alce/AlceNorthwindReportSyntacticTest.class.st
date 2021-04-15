Class {
	#name : #AlceNorthwindReportSyntacticTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest class >> setupReportMonthlySalesReport_Open [
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
AlceNorthwindReportSyntacticTest class >> setupReportQuarterlySalesReport_Open [
^ {
(#setup -> #setupReportQuarterlySales).
	(#fixture
		->
			{(#functionOrSub -> #Report_Open).
			(#assignments -> 12).
			(#outgoingInvocations -> 8).
			(#localVariables -> 4).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest class >> setupReportYearlySalesReport_Open [
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
AlceNorthwindReportSyntacticTest class >> testParameters [
	^ super testParameters
		addCase: self setupReportMonthlySalesReport_Open;
		addCase: self setupReportQuarterlySalesReport_Open;
		addCase: self setupReportYearlySalesReport_Open
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"

	actual = expected
		ifFalse: [ (self class class methods
				detect: [ :m | 
					| sc |
					sc := m sourceCode.
					(sc includesSubstring: setup)
						and: [ sc includesSubstring: '#' , (fixture at: #functionOrSub) ] ])
				browse ].
	^ self
		assert: actual = expected
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> assertIfFunction: aBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^ self skip ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a typeName isString and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | a attributeName isString and: [ a attributeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionHasParameters [
	self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		do: [ :p :pt | self assert: p typeName equals: pt ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p typeName isString and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinedFunctionReturnsBoolean [
	self
		assertIfFunction: [ self
				assert: self functionOrSub typeName
				equals: (fixture at: #return).
			true ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testFunctionReturnsType [
	self assertIfFunction: [ self functionOrSub typeName isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	| isMessageSend |
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			isMessageSend := inv invocationExpression includes: $..
			self assert: inv isVBMessageSend equals: isMessageSend ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver isNotEmpty ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportSyntacticTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self
						assert: inv receiver , '.' , inv selector
						equals: inv invocationExpression ]
				ifFalse:
					[ self assert: inv selector equals: inv invocationExpression ] ]
]
