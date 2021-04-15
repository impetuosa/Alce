Class {
	#name : #AlceNorthwindOverviewPrivileges,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'test - module' }
AlceNorthwindOverviewPrivileges >> setUp [
	super setUp.
	self setupModulePrivileges 
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPrivileges >> testModuleDefinesNEnum [
	self assert: self module types first class equals: AlcixEnum
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPrivileges >> testModuleDefinesOneEnumWith2Values [
	self assert: self module types first enumValues size equals: 2
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPrivileges >> testModuleDefinesOneEnumWithWithNames [
	self
		assert: self module types first enumValues first name
		equals: 'Administrator_Privilege'.
	self
		assert: self module types first enumValues second name
		equals: 'PurchaseApprovals_Privilege'
]

{ #category : #'types definitions' }
AlceNorthwindOverviewPrivileges >> testModuleDefinesOneType [
	self assert: self module types size equals: 1
]

{ #category : #'test - module' }
AlceNorthwindOverviewPrivileges >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindOverviewPrivileges >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 4
]

{ #category : #'test - module' }
AlceNorthwindOverviewPrivileges >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindOverviewPrivileges >> testModuleHasOnlyFunctions [
	self
		assert: (self module invocables allSatisfy: [ :i | i class = AlcixFunction ])
]
