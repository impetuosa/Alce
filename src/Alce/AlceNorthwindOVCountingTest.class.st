Class {
	#name : #AlceNorthwindOVCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'test - module' }
AlceNorthwindOVCountingTest >> setUp [
	super setUp.
	self setupModulePrivileges 
]

{ #category : #'types definitions' }
AlceNorthwindOVCountingTest >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindOVCountingTest >> testModuleDefinesOneEnumWith2Values [
	self assert: self module types first enumValues size equals: 2
]

{ #category : #'types definitions' }
AlceNorthwindOVCountingTest >> testModuleDefinesOneEnumWithWithNames [
	self
		assert: self module types first enumValues first name
		equals: 'Administrator_Privilege'.
	self
		assert: self module types first enumValues second name
		equals: 'PurchaseApprovals_Privilege'
]

{ #category : #'types definitions' }
AlceNorthwindOVCountingTest >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindOVCountingTest >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindOVCountingTest >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 4
]

{ #category : #'test - module' }
AlceNorthwindOVCountingTest >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindOVCountingTest >> testModuleHasOnlyFunctions [
	self
		assert: (self module invocables allSatisfy: [ :i | i class = AlcixFunction ])
]
