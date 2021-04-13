Class {
	#name : #AlceNorthwindCustomerOrdersSyntacticModuleTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> setUp [
	super setUp.
	self setupModuleCustomerOrders
]

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleCustomerOrders [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleDefinesOneEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleDefinesOneEnumWithFourValues [
	self assert: self module types first enumValues size equals: 4
]

{ #category : #'types definitions' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleDefinesOneEnumWithFourValuesWithNames [
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
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'functions overview' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleHas5Functions [
	self
		assert:
			(self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 5
]

{ #category : #'functions overview' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testModuleHasOnlyFunctions [
	self
		assert: (self module invocables allSatisfy: [ :i | i class = AlcixFunction ])
]
