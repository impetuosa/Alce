Class {
	#name : #AlceNorthwindClassSyntacticTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassErrorHandlingLogError [
^ {
(#setup -> #setupClassErrorHandling).
	(#fixture
		->
			{(#functionOrSub -> #LogError).
			(#assignments -> 3).
			(#outgoingInvocations -> 4).
			(#localVariables -> 2).
			(#return -> #Boolean).
			(#parameters -> {#String.#'ParamArray()'})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassErrorHandlingTryToCloseObject [
^ {
(#setup -> #setupClassErrorHandling).
	(#fixture
		->
			{(#functionOrSub -> #TryToCloseObject).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassErrorHandlingTryToGoToRecord [
^ {
(#setup -> #setupClassErrorHandling).
	(#fixture
		->
			{(#functionOrSub -> #TryToGoToRecord).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {#AcRecord })})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassErrorHandlingTryToRunCommand [
^ {
(#setup -> #setupClassErrorHandling).
	(#fixture
		->
			{(#functionOrSub -> #TryToRunCommand).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {#AcCommand})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassErrorHandlingTryToSaveRecord [
^ {
(#setup -> #setupClassErrorHandling).
	(#fixture
		->
			{(#functionOrSub -> #TryToSaveRecord).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperAddNew [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #AddNew).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperClass_Terminate [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #Class_Terminate ).
			(#assignments -> 1).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperCloseRecordset [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #CloseRecordset ).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperDelete [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #Delete).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperEdit [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #Edit).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperGetRecordsetClone [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #GetRecordsetClone).
			(#assignments -> 1).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #DAORecordset2).
			(#parameters -> {#DAORecordset2})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperMoveNext [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #MoveNext ).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperOpenRecordset [
	^ {(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #OpenRecordset).
			(#assignments -> 3).
			(#outgoingInvocations -> 6).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters
				->
					{#String . #String . #String . #'DAO.RecordsetTypeEnum'.
					#'DAO.RecordsetOptionEnum'})})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest class >> setupClassRecordsetWrapperUpdate [
^ {
(#setup -> #setupClassRecordsetWrapper).
	(#fixture
		->
			{(#functionOrSub -> #Update ).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'building suites' }
AlceNorthwindClassSyntacticTest class >> testParameters [
	^ super testParameters
		addCase: self setupClassRecordsetWrapperAddNew;
		addCase: self setupClassRecordsetWrapperMoveNext;
		addCase: self setupClassRecordsetWrapperEdit;
		addCase: self setupClassRecordsetWrapperClass_Terminate;
		addCase: self setupClassErrorHandlingLogError;
		addCase: self setupClassErrorHandlingTryToGoToRecord;
		addCase: self setupClassRecordsetWrapperUpdate;
		addCase: self setupClassErrorHandlingTryToRunCommand;
		addCase: self setupClassErrorHandlingTryToCloseObject;
		addCase: self setupClassRecordsetWrapperOpenRecordset;
		addCase: self setupClassRecordsetWrapperCloseRecordset;
		addCase: self setupClassErrorHandlingTryToSaveRecord;
		addCase: self setupClassRecordsetWrapperGetRecordsetClone;
		addCase: self setupClassRecordsetWrapperDelete
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"
"
	actual = expected
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
AlceNorthwindClassSyntacticTest >> assertIfFunction: aBlockClosure [
	^ self assertIfFunction: aBlockClosure ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a typeName isString and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | a attributeName isString and: [ a attributeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionHasParameters [
	self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		do: [ :p :pt | self assert: p typeName equals: pt ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p typeName isString and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinedFunctionReturnsBoolean [
	self
		assertIfFunction: [ self
				assert: self functionOrSub typeName
				equals: (fixture at: #return).
			true ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testFunctionReturnsType [
	self assertIfFunction: [ self functionOrSub typeName isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	| isMessageSend |
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			isMessageSend := inv invocationExpression includes: $..
			self assert: inv isVBMessageSend equals: isMessageSend ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver isNotEmpty ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self
						assert: inv receiver , '.' , inv selector
						equals: inv invocationExpression ]
				ifFalse:
					[ self assert: inv selector equals: inv invocationExpression ] ]
]
