Class {
	#name : #AlceNorthwindModuleBindingTest,
	#superclass : #AlceNorthwindCachedModelAbstractTest,
	#category : #'Alce-Test-Bind'
}

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleCustomerOrdersCreateInvoice [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #CustomerOrders).
	(#fixture -> {
	(#functionOrSub -> #CreateInvoice).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleCustomerOrdersDelete [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #CustomerOrders).
	(#fixture -> {
	(#functionOrSub -> #Delete).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleCustomerOrdersIsInvoiced [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #CustomerOrders).
	(#fixture -> {
	(#functionOrSub -> #IsInvoiced).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleCustomerOrdersPrintInvoice [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #CustomerOrders).
	(#fixture -> {
	(#functionOrSub -> #PrintInvoice).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleCustomerOrdersSetStatus [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #CustomerOrders).
	(#fixture -> {
	(#functionOrSub -> #SetStatus).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDAvgWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DAvgWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDCountWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DCountWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDLookupNumberWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DLookupNumberWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDLookupStringWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DLookupStringWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDLookupWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DLookupWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDMaxWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DMaxWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDMinWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DMinWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDSumWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DSumWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleDomainFunctionWrappersDomainFunctionWrapper [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #DomainFunctionWrappers).
	(#fixture -> {
	(#functionOrSub -> #DomainFunctionWrapper).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryAddHold [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #AddHold).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryAddPurchase [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #AddPurchase).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryDeleteTransaction [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #DeleteTransaction).
	(#accessBoundAttributes -> 2) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryEditTransaction [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #EditTransaction).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryFillBackOrder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #FillBackOrder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryFillBackOrders [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #FillBackOrders).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryFindProductSupplier [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #FindProductSupplier).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetInventoryQuantity [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetInventoryQuantity).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetQtyAvailable [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetQtyAvailable).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetQtyOnBackOrder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetQtyOnBackOrder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetQtyOnHand [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetQtyOnHand).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetQtyToReorder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetQtyToReorder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetRestockingPurchaseOrder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetRestockingPurchaseOrder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryGetTransaction [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #GetTransaction).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryHoldToSold [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #HoldToSold).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryModifyHold [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #ModifyHold).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 3) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryRemoveHold [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #RemoveHold).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryRemovePurchase [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #RemovePurchase).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryRequestHold [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #RequestHold).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleInventoryRestockProduct [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Inventory).
	(#fixture -> {
	(#functionOrSub -> #RestockProduct).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePrivilegesCanApprovePurchases [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Privileges).
	(#fixture -> {
	(#functionOrSub -> #CanApprovePurchases).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePrivilegesEmployeeHas [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Privileges).
	(#fixture -> {
	(#functionOrSub -> #EmployeeHas).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePrivilegesGetCurrentUserID [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Privileges).
	(#fixture -> {
	(#functionOrSub -> #GetCurrentUserID).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePrivilegesIsAdministrator [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Privileges).
	(#fixture -> {
	(#functionOrSub -> #IsAdministrator).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersCreate [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #Create).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersCreateLineItem [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #CreateLineItem).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersDelete [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #Delete).
	(#accessBoundAttributes -> 2) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersExists [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #Exists).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersGenerate [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #Generate).
	(#accessBoundAttributes -> 1) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersGetListPrice [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #GetListPrice).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersGetStandardCost [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #GetStandardCost).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersGetStatus [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #GetStatus).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersMarkApproved [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #MarkApproved).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersMarkSubmitted [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #MarkSubmitted).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersNewOrder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #NewOrder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersOpenOrder [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #OpenOrder).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModulePurchaseOrdersSetStatus [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #PurchaseOrders).
	(#fixture -> {
	(#functionOrSub -> #SetStatus).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleReflectiveRecordsetWrapperConstructor [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Reflective).
	(#fixture -> {
	(#functionOrSub -> #RecordsetWrapperConstructor).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesDebuggingSupported [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #DebuggingSupported).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 2) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesHasSourceCode [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #HasSourceCode).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesInsertString [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #InsertString).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesIsRuntime [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #IsRuntime).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesLoadString [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #LoadString).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesMsgBoxID [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #MsgBoxID).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesMsgBoxOKOnly [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #MsgBoxOKOnly).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 1) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'set up' }
AlceNorthwindModuleBindingTest class >> setupAlcixModuleUtilitiesMsgBoxYesNo [
	^ {(#kind -> AlcixModule).
	(#nameOfFSTCitizen -> #Utilities).
	(#fixture -> {
	(#functionOrSub -> #MsgBoxYesNo).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 1) 
	})}
]

{ #category : #parameters }
AlceNorthwindModuleBindingTest class >> testParameters [
	^ super testParameters
		addCase: self setupAlcixModuleInventoryGetQtyAvailable;
		addCase: self setupAlcixModuleDomainFunctionWrappersDSumWrapper;
		addCase: self setupAlcixModuleCustomerOrdersCreateInvoice;
		addCase: self setupAlcixModuleDomainFunctionWrappersDomainFunctionWrapper;
		addCase: self setupAlcixModulePrivilegesGetCurrentUserID;
		addCase: self setupAlcixModuleDomainFunctionWrappersDCountWrapper;
		addCase: self setupAlcixModuleInventoryRequestHold;
		addCase: self setupAlcixModulePurchaseOrdersSetStatus;
		addCase: self setupAlcixModuleDomainFunctionWrappersDLookupNumberWrapper;
		addCase: self setupAlcixModulePurchaseOrdersNewOrder;
		addCase: self setupAlcixModuleInventoryDeleteTransaction;
		addCase: self setupAlcixModulePurchaseOrdersGetStatus;
		addCase: self setupAlcixModuleInventoryRestockProduct;
		addCase: self setupAlcixModuleInventoryRemovePurchase;
		addCase: self setupAlcixModulePurchaseOrdersMarkApproved;
		addCase: self setupAlcixModulePurchaseOrdersGetStandardCost;
		addCase: self setupAlcixModuleInventoryFillBackOrders;
		addCase: self setupAlcixModuleInventoryGetQtyOnBackOrder;
		addCase: self setupAlcixModuleUtilitiesMsgBoxOKOnly;
		addCase: self setupAlcixModuleCustomerOrdersSetStatus;
		addCase: self setupAlcixModulePurchaseOrdersCreateLineItem;
		addCase: self setupAlcixModuleInventoryGetQtyOnHand;
		addCase: self setupAlcixModuleInventoryAddPurchase;
		addCase: self setupAlcixModuleDomainFunctionWrappersDMinWrapper;
		addCase: self setupAlcixModuleInventoryRemoveHold;
		addCase: self setupAlcixModuleInventoryGetRestockingPurchaseOrder;
		addCase: self setupAlcixModulePurchaseOrdersExists;
		addCase: self setupAlcixModuleCustomerOrdersIsInvoiced;
		addCase: self setupAlcixModuleUtilitiesDebuggingSupported;
		addCase: self setupAlcixModulePurchaseOrdersDelete;
		addCase: self setupAlcixModuleDomainFunctionWrappersDMaxWrapper;
		addCase: self setupAlcixModuleInventoryAddHold;
		addCase: self setupAlcixModuleInventoryFillBackOrder;
		addCase: self setupAlcixModulePrivilegesEmployeeHas;
		addCase: self setupAlcixModuleInventoryGetInventoryQuantity;
		addCase: self setupAlcixModulePurchaseOrdersGenerate;
		addCase: self setupAlcixModuleUtilitiesMsgBoxYesNo;
		addCase: self setupAlcixModuleDomainFunctionWrappersDLookupStringWrapper;
		addCase: self setupAlcixModuleInventoryHoldToSold;
		addCase: self setupAlcixModuleDomainFunctionWrappersDAvgWrapper;
		addCase: self setupAlcixModuleUtilitiesHasSourceCode;
		addCase: self setupAlcixModulePurchaseOrdersOpenOrder;
		addCase: self setupAlcixModuleInventoryFindProductSupplier;
		addCase: self setupAlcixModuleInventoryGetQtyToReorder;
		addCase: self setupAlcixModulePrivilegesCanApprovePurchases;
		addCase: self setupAlcixModulePurchaseOrdersCreate;
		addCase: self setupAlcixModuleReflectiveRecordsetWrapperConstructor;
		addCase: self setupAlcixModulePurchaseOrdersMarkSubmitted;
		addCase: self setupAlcixModuleUtilitiesMsgBoxID;
		addCase: self setupAlcixModulePurchaseOrdersGetListPrice;
		addCase: self setupAlcixModuleCustomerOrdersDelete;
		addCase: self setupAlcixModuleInventoryModifyHold;
		addCase: self setupAlcixModuleInventoryGetTransaction;
		addCase: self setupAlcixModuleCustomerOrdersPrintInvoice;
		addCase: self setupAlcixModuleUtilitiesIsRuntime;
		addCase: self setupAlcixModulePrivilegesIsAdministrator;
		addCase: self setupAlcixModuleInventoryEditTransaction;
		addCase: self setupAlcixModuleUtilitiesLoadString;
		addCase: self setupAlcixModuleUtilitiesInsertString;
		addCase: self setupAlcixModuleDomainFunctionWrappersDLookupWrapper
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> setUp [
	super setUp.
	AlceLinker link: model . 
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testAccessesAreBoundProperly [


	self
		assert:
			(self functionOrSub accesses select: [ :s | s rightElement isNotNil ])
				size
		equals: (fixture at: #accessBoundAttributes)
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testBoundedReturnType [
	self functionOrSub class = AlcixSubProcedure
		ifTrue: [ ^ self skip ].
	self
		assert: self functionOrSub type isNotNil
		equals: (fixture at: #returnTypeBindingExpected)
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testBoundedVariableTypes [
	self
		assert:
			(self functionOrSub localVariables select: [ :s | s type isNotNil ])
				size
		equals: (fixture at: #variableTypesBound)
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testBoundedVariables [
	self
		assert:
			(self functionOrSub localVariables
				select: [ :s | 
					s readingAccesses isEmptyOrNil not
						or: [ s writingAccesses isEmptyOrNil not ] ]) size
		equals: (fixture at: #variableBound)
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testIncomingCallsAreBoundProperly [
	self
		assert: self functionOrSub incomingInvocations size
		equals: (fixture at: #expectedIncomingBound)
]

{ #category : #tests }
AlceNorthwindModuleBindingTest >> testOutgoingCallsAreBoundProperly [

	self
		assert: (self functionOrSub outgoingInvocations select: [ :s | s candidate isNotNil ]) size
		equals: (fixture at: #expectedOutgoingBound) 
]
