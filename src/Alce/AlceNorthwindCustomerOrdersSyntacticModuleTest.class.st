Class {
	#name : #AlceNorthwindCustomerOrdersSyntacticModuleTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests'
}

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> createInvoice [
	^ self module invocables detect: [ :f | f selector = 'CreateInvoice' ]
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> delete [
	^ self module invocables detect: [ :f | f selector = 'Delete' ]
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> isInvoiced [
	^ self module invocables detect: [ :f | f selector = 'IsInvoiced' ]
]

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> printInvoice [
	^ self module invocables detect: [ :f | f selector = 'PrintInvoice' ]
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> setStatus [
	^ self module invocables detect: [ :f | f selector = 'SetStatus' ]
]

{ #category : #'test - module' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> setUp [
	super setUp.
	self setupModuleCustomerOrders
]

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesCreateInvoice [
	self
		assert:
			(self module invocables anySatisfy: [ :f | f selector = 'CreateInvoice' ])
]

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesCreateInvoiceHasFourAssignments [
	self
		assert: (self createInvoice accesses select: #isWriting) size
		equals: 4
]

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesCreateInvoiceHasOneOutgoingInvocation [
	self assert: self createInvoice outgoingInvocations size equals: 1
]

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesCreateInvoiceHasOneVariable [
	self assert: self createInvoice localVariables size equals: 1
]

{ #category : #'specific function create invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesCreateInvoiceReturnsBoolean [
	self assert: self createInvoice typeName  equals: #Boolean
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesDelete [
	self
		assert:
			(self module invocables anySatisfy: [ :f | f selector = 'Delete' ])
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesDeleteHasNoneAssignments [
	self
		assert: (self delete accesses select: #isWriting) size
		equals: 0
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesDeleteHasOneVariable [
	self assert: self delete localVariables size equals: 1
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesDeleteHasTwoOutgoingInvocation [
	self assert: self delete outgoingInvocations size equals: 2
]

{ #category : #'specific function delete' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesDeleteReturnsBoolean [
	self assert: self delete typeName  equals: #Boolean
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesIsInvoiced [
	self
		assert:
			(self module invocables anySatisfy: [ :f | f selector = 'IsInvoiced' ])
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesIsInvoicedHasNoneAssignments [
	self
		assert: (self isInvoiced accesses select: #isWriting) size
		equals: 0
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesIsInvoicedHasNoneVariable [
	self assert: self isInvoiced localVariables size equals: 0
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesIsInvoicedReturnsBoolean [
	self assert: self isInvoiced typeName  equals: #Boolean
]

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesPrintInvoice [
	self
		assert:
			(self module invocables anySatisfy: [ :f | f selector = 'PrintInvoice' ])
]

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesPrintInvoiceHasNoneAssignments [
	self
		assert: (self isInvoiced accesses select: #isWriting) size
		equals: 0
]

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesPrintInvoiceHasNoneVariable [
	self assert: self isInvoiced localVariables size equals: 0
]

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesPrintInvoiceReturnsBoolean [
	self assert: self isInvoiced typeName  equals: #Boolean
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesSetStatus [
	self
		assert:
			(self module invocables anySatisfy: [ :f | f selector = 'SetStatus' ])
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesSetStatusHasOneVariable [
	self assert: self setStatus localVariables size equals: 1
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesSetStatusHasTwoAssignments [
	self
		assert: (self setStatus accesses select: #isWriting) size
		equals: 2
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesSetStatusHasTwoOutgoingInvocation [
	self assert: self setStatus outgoingInvocations size equals: 2
]

{ #category : #'specific function set status' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testDefinesSetStatusReturnsBoolean [
	self assert: self setStatus typeName  equals: #Boolean
]

{ #category : #'specific function is invoiced' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testIsInvoicedHasOneOutgoingInvocation [
	self assert: self isInvoiced outgoingInvocations size equals: 1
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

{ #category : #'specific function print invoice' }
AlceNorthwindCustomerOrdersSyntacticModuleTest >> testPrintInvoiceHasOneOutgoingInvocation [
	self assert: self isInvoiced outgoingInvocations size equals: 1
]
