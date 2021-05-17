Class {
	#name : #AlceNorthwindReflectiveOVCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'test - module' }
AlceNorthwindReflectiveOVCountingTest >> setUp [
	super setUp.
	self setupModuleReflective 
]

{ #category : #'types definitions' }
AlceNorthwindReflectiveOVCountingTest >> testModuleDefines0Types [
	self assert: self module types size equals: 0
]

{ #category : #'test - module' }
AlceNorthwindReflectiveOVCountingTest >> testModuleHasModule [
	self assertLoads: 1 of: AlcixModule. 
]

{ #category : #'functions overview' }
AlceNorthwindReflectiveOVCountingTest >> testModuleHasNFunctions [
	self
		assert: (self module invocables select: [ :i | i class = AlcixFunction ]) size
		equals: 1
]

{ #category : #'test - module' }
AlceNorthwindReflectiveOVCountingTest >> testModuleHasNMembers [
	self assert: self module members size equals: 0
]

{ #category : #'functions overview' }
AlceNorthwindReflectiveOVCountingTest >> testModuleHasOnlyFunctions [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | {AlcixFunction} includes: i class ])
]

{ #category : #'functions overview' }
AlceNorthwindReflectiveOVCountingTest >> testModuleHasOnlyFunctionsAndSubs [
	self
		assert:
			(self module invocables
				allSatisfy: [ :i | 
					{AlcixFunction.
					AlcixSubProcedure} includes: i class ])
]
