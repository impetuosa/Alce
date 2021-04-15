Class {
	#name : #AlceNorthwindOverviewReflective,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'test - module' }
AlceNorthwindOverviewReflective >> setUp [
	super setUp.
	self setupModuleReflective 
]

{ #category : #'types definitions' }
AlceNorthwindOverviewReflective >> testModuleDefines0Types [
	self assert: self module types size equals: 0
]

{ #category : #'test - module' }
AlceNorthwindOverviewReflective >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindOverviewReflective >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 1
]

{ #category : #'test - module' }
AlceNorthwindOverviewReflective >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindOverviewReflective >> testModuleHasOnlyFunctions [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | {AlcixFunction} includes: i class ])
]

{ #category : #'functions overview' }
AlceNorthwindOverviewReflective >> testModuleHasOnlyFunctionsAndSubs [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | 
					{AlcixFunction.
					AlcixSubProcedure} includes: i class ])
]
