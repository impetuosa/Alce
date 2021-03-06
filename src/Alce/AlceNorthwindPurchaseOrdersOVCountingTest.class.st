Class {
	#name : #AlceNorthwindPurchaseOrdersOVCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'test - module' }
AlceNorthwindPurchaseOrdersOVCountingTest >> setUp [
	super setUp.
	self setupModulePurchaseOrders 
]

{ #category : #'types definitions' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleDefinesOneEnumWith4Values [
	self assert: self module types first enumValues size equals: 4
]

{ #category : #'types definitions' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleDefinesOneEnumWithWithNames [
	self
		assert: self module types first enumValues first name
		equals: 'New_PurchaseOrder'.
	self
		assert: self module types first enumValues second name
		equals: 'Submitted_PurchaseOrder'.
	self
		assert: self module types first enumValues third name
		equals: 'Approved_PurchaseOrder'.
	self
		assert: (self module types first enumValues at: 4) name
		equals: 'Closed_PurchaseOrder'
]

{ #category : #'types definitions' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 11
]

{ #category : #'test - module' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleHasNSubProcedures [
	self
		assert: (self module invocables select: [ :i | i class = AlcixSubProcedure  ]) size
		equals: 2
]

{ #category : #'functions overview' }
AlceNorthwindPurchaseOrdersOVCountingTest >> testModuleHasOnlyFunctionsAndSubs [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | 
					{AlcixFunction.
					AlcixSubProcedure} includes: i class ])
]
