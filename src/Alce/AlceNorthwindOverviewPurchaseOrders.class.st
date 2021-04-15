Class {
	#name : #AlceNorthwindOverviewPurchaseOrders,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'test - module' }
AlceNorthwindOverviewPurchaseOrders >> setUp [
	super setUp.
	self setupModulePurchaseOrders 
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPurchaseOrders >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPurchaseOrders >> testModuleDefinesOneEnumWith4Values [
	self assert: self module types first enumValues size equals: 4
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPurchaseOrders >> testModuleDefinesOneEnumWithWithNames [
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
AlceNorthwindOverviewPurchaseOrders >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindOverviewPurchaseOrders >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindOverviewPurchaseOrders >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 11
]

{ #category : #'test - module' }
AlceNorthwindOverviewPurchaseOrders >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindOverviewPurchaseOrders >> testModuleHasNSubProcedures [
	self
		assert: (self module invocables select: [ :i | i class = AlcixSubProcedure  ]) size
		equals: 2
]

{ #category : #'functions overview' }
AlceNorthwindOverviewPurchaseOrders >> testModuleHasOnlyFunctionsAndSubs [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | 
					{AlcixFunction.
					AlcixSubProcedure} includes: i class ])
]
