Class {
	#name : #AlceNorthwindClassSyntacticCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest class >> setupClassErrorHandlingLogError [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassErrorHandlingTryToCloseObject [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassErrorHandlingTryToGoToRecord [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassErrorHandlingTryToRunCommand [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassErrorHandlingTryToSaveRecord [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperAddNew [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperClass_Terminate [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperCloseRecordset [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperDelete [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperEdit [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperGetRecordsetClone [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperMoveNext [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperOpenRecordset [
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
AlceNorthwindClassSyntacticCountingTest class >> setupClassRecordsetWrapperUpdate [
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
AlceNorthwindClassSyntacticCountingTest class >> testParameters [
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
AlceNorthwindClassSyntacticCountingTest >> assert: actual equals: expected [
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
AlceNorthwindClassSyntacticCountingTest >> assertIfFunction: aBlockClosure [
	^ self assertIfFunction: aBlockClosure ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a typeName isString and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | a attributeName isString and: [ a attributeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionHasParameters [
	self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		do: [ :p :pt | self assert: p typeName equals: pt ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p typeName isString and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinedFunctionReturnsBoolean [
	self
		assertIfFunction: [ self
				assert: self functionOrSub typeName
				equals: (fixture at: #return).
			true ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testFunctionReturnsType [
	self
		assertIfFunction: [ self functionOrSub typeName isString ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	| isMessageSend |
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			isMessageSend := inv selector includes: $..
			self assert: inv isVBMessageSend equals: isMessageSend ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver class equals: AlcixAccess ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassSyntacticCountingTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver asString equals: inv selector ]
				ifFalse: [ self assert: (inv selector indexOf: $.) equals: 0 ] ]
]
