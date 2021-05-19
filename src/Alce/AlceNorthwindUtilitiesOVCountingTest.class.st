Class {
	#name : #AlceNorthwindUtilitiesOVCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'types definitions' }
AlceNorthwindUtilitiesOVCountingTest >> enumNameAndValues [
	^ {('AppTitle' -> 2).
	('CannotRemovePostedInventory' -> 3).
	('FilledBackOrderedProduct' -> 4).
	('DiscountedPriceBelowCost' -> 5).
	('InsufficientInventory' -> 6).
	('NoInventoryCreatePO' -> 7).
	('PurchaseOrdersCreated' -> 8).
	('NoProductsBelowReorderLevels' -> 9).
	('MustSpecifyCustomer' -> 10).
	('RestockAllInventory' -> 11).
	('CannotCreatePO_NoSupplier' -> 12).
	('PriceBelowCost' -> 13).
	('WantToContinue' -> 14).
	('OrderAlreadyInvoiced' -> 15).
	('OrderDoesNotContainLineItems' -> 16).
	('MustBeAllocatedBeforeInvoicing' -> 17).
	('NoSalesInPeriod' -> 18).
	('RestockSuccess' -> 19).
	('NoNeedToRestock' -> 21).
	('RestockingFailed' -> 22).
	('InvalidLogin' -> 23).
	('MustFirstSelectReport' -> 24).
	('ChangeSupplierWarning' -> 25).
	('RestockingSummary' -> 26).
	('RestockingError' -> 27).
	('RestockingDetails' -> 28).
	('CannotRemovePostedItems' -> 29).
	('ErrorRemovingPurchaseLineItems' -> 30).
	('CannotModifyPurchaseQuantity' -> 31).
	('CannotModifyPurchasePrice' -> 32).
	('InventoryPostingSuccess' -> 33).
	('InventoryPostingFailure' -> 34).
	('FillBackOrdersPrompt' -> 35).
	('CannotPostNoReceivedDate' -> 36).
	('PostReceivedProductPrompt' -> 37).
	('InitializeAppData' -> 38).
	('MustSpecifyEmployeeName' -> 39).
	('MustBeLoggedInToApprovePurchase' -> 40).
	('CannotApprovePurchaseWithoutLineItems' -> 41).
	('CannotApprovePurchases' -> 42).
	('PurchaseApproved' -> 43).
	('PurchaseNotApproved' -> 44).
	('PurchaseSubmitted' -> 45).
	('PurchaseNotSubmitted' -> 46).
	('PurchaseHasNoLineItems' -> 47).
	('CancelOrderPrompt' -> 48).
	('CancelOrderConfirmPrompt' -> 49).
	('CancelOrderSuccess' -> 100).
	('CannotCancelPostedOrder' -> 101).
	('CancelOrderFailure' -> 102).
	('OrderIsNotInvoiced' -> 103).
	('ShippingNotComplete' -> 104).
	('CannotShipNotInvoiced' -> 105).
	('CannotCancelShippedOrder' -> 106).
	('MustSpecifySalesPerson' -> 107).
	('OrderMarkedClosed' -> 108).
	('OrderMustBeShippedToClose' -> 109).
	('PaymentInfoNotComplete' -> 110).
	('ErrorAttemptingToRestock' -> 111).
	('NeedUnitCost' -> 112).
	('FillBackOrderedProduct' -> 113).
	('PurchaseGeneratedBasedOnOrder' -> 114)}
]

{ #category : #'test - module' }
AlceNorthwindUtilitiesOVCountingTest >> setUp [
	super setUp.
	self setupModuleUtilities 
]

{ #category : #'types definitions' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleDefinesOneEnumWith62Values [
	self assert: self module types first enumValues size equals: 62
]

{ #category : #'types definitions' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleDefinesOneEnumWithNamesAndValues [
	self module types first enumValues asOrderedCollection
		with: self enumNameAndValues
		do: [ :e :env | 
			self assert: e name equals: env key.
			self assert: e Value equals: env value ]
]

{ #category : #'types definitions' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasMemberNamedEh [
	self
		assert: self module members first name
		equals: 'eh'
]

{ #category : #'test - module' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasMemberTypeErrorHandling [
	self
		assert: self module members first typeName
		equals: 'ErrorHandling'
]

{ #category : #'test - module' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 7
]

{ #category : #'test - module' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasNMembers [
	self assert: self module members size equals: 1
]

{ #category : #'functions overview' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasNSubProcedures [
	self
		assert: (self module invocables select: [ :i | i class = AlcixSubProcedure  ]) size
		equals: 1
]

{ #category : #'functions overview' }
AlceNorthwindUtilitiesOVCountingTest >> testModuleHasOnlyFunctionsAndSubs [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | 
					{AlcixFunction.
					AlcixSubProcedure} includes: i class ])
]
