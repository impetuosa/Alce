Class {
	#name : #AlceNorthwindCustomerOrdersOverviewCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> setUp [
	super setUp.
	self setupModuleCustomerOrders
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleDefinesOneEnumWithFourValues [
	self assert: self module types first enumValues size equals: 4
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleDefinesOneEnumWithFourValuesWithNames [
	self
		assert: self module types first enumValues first name
		equals: 'New_CustomerOrder'.
	self
		assert: self module types first enumValues second name
		equals: 'Invoiced_CustomerOrder'.
	self
		assert: self module types first enumValues third name
		equals: 'Shipped_CustomerOrder'.
	self
		assert: (self module types first enumValues at: 4) name
		equals: 'Closed_CustomerOrder'
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 5
]

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindCustomerOrdersOverviewCountingTest >> testModuleHasOnlyFunctions [
	self
		assert: (self module invocables allSatisfy: [ :i | i class = AlcixFunction ])
]
