Class {
	#name : #AlceNorthwindModulesSyntacticTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'customer purchase' }
AlceNorthwindModulesSyntacticTest class >> setupModuleCustomerOrdersCaseCreateInvoice [
	^ {(#setup -> #setupModuleCustomerOrders).
	(#fixture
		->
			{(#functionOrSub -> #CreateInvoice).
			(#assignments -> 4).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long Currency Long))})}
]

{ #category : #'customer purchase' }
AlceNorthwindModulesSyntacticTest class >> setupModuleCustomerOrdersCaseDelete [
	^ {(#setup -> #setupModuleCustomerOrders).
	(#fixture
		->
			{(#functionOrSub -> #Delete).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'customer purchase' }
AlceNorthwindModulesSyntacticTest class >> setupModuleCustomerOrdersCaseIsInvoiced [
	^ {(#setup -> #setupModuleCustomerOrders).
	(#fixture
		->
			{(#functionOrSub -> #IsInvoiced).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> #(Long)) })}
]

{ #category : #'customer purchase' }
AlceNorthwindModulesSyntacticTest class >> setupModuleCustomerOrdersCasePrintInvoice [
	^ {(#setup -> #setupModuleCustomerOrders).
	(#fixture
		->
			{(#functionOrSub -> #PrintInvoice).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'customer purchase' }
AlceNorthwindModulesSyntacticTest class >> setupModuleCustomerOrdersCaseSetStatus [
	^ {(#setup -> #setupModuleCustomerOrders).
	(#fixture
		->
			{(#functionOrSub -> #SetStatus).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long CustomerOrderStatusEnum))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDAvgWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DAvgWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDCountWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DCountWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDLookupNumberWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DLookupNumberWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Variant).
			(#parameters -> #(String String String Undefined))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDLookupStringWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DLookupStringWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #String).
			(#parameters -> #(String String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDLookupWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DLookupWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Variant).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDMaxWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DMaxWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDMinWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DMinWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainDSumWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DSumWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String String String))})}
]

{ #category : #'domain function' }
AlceNorthwindModulesSyntacticTest class >> setupModuleDomainFunctionDomainFunctionWrapper [
	^ {(#setup -> #setupModuleDomainFunction).
	(#fixture
		->
			{(#functionOrSub -> #DomainFunctionWrapper).
			(#assignments -> 0).
			(#outgoingInvocations -> 9).
			(#localVariables -> 0).
			(#return -> #Variant).
			(#parameters -> #(DomainFunctionWrapperEnum String String String))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryAddHold [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #AddHold).
			(#assignments -> 9).
			(#outgoingInvocations -> 2).
			(#localVariables -> 3).
			(#return -> #Boolean).
			(#parameters -> #(Long InventoryTransaction))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryAddPurchase [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #AddPurchase).
			(#assignments -> 5).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long Long Long Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryDeleteTransaction [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #DeleteTransaction).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryEditTransaction [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #EditTransaction).
			(#assignments -> 9).
			(#outgoingInvocations -> 7).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(InventoryTransaction Undefined Undefined))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryFillBackOrder [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #FillBackOrder).
			(#assignments -> 2).
			(#outgoingInvocations -> 4).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> #(Long InventoryTransaction))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryFillBackOrders [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #FillBackOrders).
			(#assignments -> 5).
			(#outgoingInvocations -> 7).
			(#localVariables -> 2).
			(#return -> #Boolean).
			(#parameters -> #(Undefined))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryFindProductSupplier [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #FindProductSupplier).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetInventoryQuantity [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetInventoryQuantity).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(String Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetQtyAvailable [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetQtyAvailable).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetQtyOnBackOrder [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetQtyOnBackOrder).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetQtyOnHand [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetQtyOnHand).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetQtyToReorder [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetQtyToReorder).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetRestockingPurchaseOrder [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetRestockingPurchaseOrder).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Long).
			(#parameters -> #(Undefined))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryGetTransaction [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #GetTransaction).
			(#assignments -> 4).
			(#outgoingInvocations -> 2).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(InventoryTransaction))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryHoldToSold [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #HoldToSold).
			(#assignments -> 2).
			(#outgoingInvocations -> 2).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryModifyHold [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #ModifyHold).
			(#assignments -> 4).
			(#outgoingInvocations -> 3).
			(#localVariables -> 2).
			(#return -> #Boolean).
			(#parameters -> #(InventoryTransaction))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryRemoveHold [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #RemoveHold).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryRemovePurchase [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #RemovePurchase).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Undefined).
			(#parameters -> #(Long))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryRequestHold [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #RequestHold).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> #(Long InventoryTransaction))})}
]

{ #category : #'module inventory' }
AlceNorthwindModulesSyntacticTest class >> setupModuleInventoryRestockProduct [
	^ {(#setup -> #setupModuleInventory).
	(#fixture
		->
			{(#functionOrSub -> #RestockProduct).
			(#assignments -> 3).
			(#outgoingInvocations -> 7).
			(#localVariables -> 4).
			(#return -> #Boolean).
			(#parameters -> #(Long))})}
]

{ #category : #'building suites' }
AlceNorthwindModulesSyntacticTest class >> setupModulePrivileges [
	^ {(#setup -> #setupModulePrivileges).
	(#fixture
		->
			{(#functionOrSub -> #CreateInvoice).
			(#assignments -> 4).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> 0)})}
]

{ #category : #'building suites' }
AlceNorthwindModulesSyntacticTest class >> setupModulePurchaseOrders [
	^ {(#setup -> #setupModulePurchaseOrders).
	(#fixture
		->
			{(#functionOrSub -> #CreateInvoice).
			(#assignments -> 4).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> 0)})}
]

{ #category : #'building suites' }
AlceNorthwindModulesSyntacticTest class >> setupModuleReflective [
	^ {(#setup -> #setupModuleUtilities).
	(#fixture
		->
			{(#functionOrSub -> #setupModuleUtilities).
			(#assignments -> 4).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> 0)})}
]

{ #category : #'building suites' }
AlceNorthwindModulesSyntacticTest class >> testParameters [
	^ super testParameters
		addCase: self setupModuleCustomerOrdersCaseCreateInvoice;
		addCase: self setupModuleCustomerOrdersCaseDelete;
		addCase: self setupModuleCustomerOrdersCasePrintInvoice;
		addCase: self setupModuleCustomerOrdersCaseIsInvoiced;
		addCase: self setupModuleCustomerOrdersCaseSetStatus;
		" Domain Function "
			addCase: self setupModuleDomainFunctionDomainDAvgWrapper;
		addCase: self setupModuleDomainFunctionDomainDCountWrapper;
		addCase: self setupModuleDomainFunctionDomainDLookupNumberWrapper;
		addCase: self setupModuleDomainFunctionDomainDLookupStringWrapper;
		addCase: self setupModuleDomainFunctionDomainDLookupWrapper;
		addCase: self setupModuleDomainFunctionDomainDMaxWrapper;
		addCase: self setupModuleDomainFunctionDomainDMinWrapper;
		addCase: self setupModuleDomainFunctionDomainDSumWrapper;
		addCase: self setupModuleDomainFunctionDomainDAvgWrapper;
		" Inventory  "
			addCase: self setupModuleInventoryEditTransaction;
		addCase: self setupModuleInventoryDeleteTransaction;
		addCase: self setupModuleInventoryRestockProduct;
		addCase: self setupModuleInventoryRequestHold;
		addCase: self setupModuleInventoryGetQtyOnHand;
		addCase: self setupModuleInventoryGetRestockingPurchaseOrder;
		addCase: self setupModuleInventoryAddPurchase;
		addCase: self setupModuleInventoryGetQtyToReorder;
		addCase: self setupModuleInventoryGetInventoryQuantity;
		addCase: self setupModuleInventoryRemoveHold;
		addCase: self setupModuleInventoryGetQtyOnBackOrder;
		addCase: self setupModuleInventoryHoldToSold;
		addCase: self setupModuleInventoryAddHold;
		addCase: self setupModuleInventoryModifyHold;
		addCase: self setupModuleInventoryRemovePurchase;
		addCase: self setupModuleInventoryGetQtyAvailable;
		addCase: self setupModuleInventoryGetTransaction;
		addCase: self setupModuleInventoryFillBackOrder;
		addCase: self setupModuleInventoryFillBackOrders;
		addCase: self setupModuleInventoryFindProductSupplier
	" Customer Order "



	"


String cr join:( self class selectors select: [: s | s beginsWith:'setupModuleInventory'] thenCollect:[ :s | ' addCase: self {1};' format:{s}])
"
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> assert: aCollection allSatisfy: aBlock [
	aCollection ifEmpty: [ ^ self skip ].
	 self assert: (aCollection allSatisfy: aBlock )
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a typeName isString and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | a attributeName isString and: [ a attributeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionHasParameters [
	| comparison |
	comparison := self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		collect: [ :p :pt | p typeName = pt ].
	self assert: (comparison allSatisfy: #yourself)
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p typeName isString and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinedFunctionReturnsBoolean [
	self
		assert: self functionOrSub typeName
		equals: (fixture at: #return)
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testFunctionReturnsType [
	self assert: self functionOrSub typeName isString
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	| isMessageSend |
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			isMessageSend := inv invocationExpression includes: $..
			self assert: inv isVBMessageSend equals: isMessageSend ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver isNotEmpty ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self
						assert: inv receiver , '.' , inv selector
						equals: inv invocationExpression ]
				ifFalse:
					[ self assert: inv selector equals: inv invocationExpression ] ]
]
