Class {
	#name : #AlceNorthwindModulesSyntacticTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#instVars : [
		'fixture',
		'setup'
	],
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Variant)})}
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
			(#return -> #String)})}
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
			(#return -> #Variant)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Variant)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Long)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Undefined)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
			(#return -> #Boolean)})}
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
AlceNorthwindModulesSyntacticTest >> fixture: anAssocArray [
	fixture := anAssocArray asDictionary .
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> functionOrSub [
	^ self module invocables
		detect: [ :f | f selector = (fixture at: #functionOrSub) ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> setUp [
	super setUp.
	self perform: setup
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> setup: aSymbol [
	setup := aSymbol
]

{ #category : #'as yet unclassified' }
AlceNorthwindModulesSyntacticTest >> testDefinesCreateInvoiceReturnsBoolean [
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
