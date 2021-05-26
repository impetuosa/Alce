Class {
	#name : #AlceNorthwindFormSyntacticCountingTest,
	#superclass : #AlceNorthwindBasedSyntacticTest,
	#category : #'Alce-Tests-EntityCounting'
}

{ #category : #'form inventory list' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormInventoryListcmdPurchase_Click [
	^ {(#setup -> #setupFormInventoryList).
	(#fixture
		->
			{(#functionOrSub -> #cmdPurchase_Click).
			(#assignments -> 0).
			(#outgoingInvocations -> 5).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsClearShippingAddress [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #ClearShippingAddress).
			(#assignments -> 6).
			(#outgoingInvocations -> 0).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {} )})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsCustomer_ID_AfterUpdate [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Customer_ID_AfterUpdate).
			(#assignments -> 0).
			(#outgoingInvocations -> 3).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {} )})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsForm_Current [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Form_Current).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {} )})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsForm_Load [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Form_Load).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsSetDefaultShippingAddress [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #SetDefaultShippingAddress).
			(#assignments -> 6).
			(#outgoingInvocations -> 3).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsSubForm_Current [
^ {
(#setup -> #setupFormOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Form_Current).
			(#assignments -> 2).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsSubProduct_ID_AfterUpdate [
^ {
(#setup -> #setupFormOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Product_ID_AfterUpdate).
			(#assignments -> 5).
			(#outgoingInvocations -> 3).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsSubQuantity_AfterUpdate [
^ {
(#setup -> #setupFormOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Quantity_AfterUpdate).
			(#assignments -> 13).
			(#outgoingInvocations -> 11).
			(#localVariables -> 3).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailsSubStatus_Name_DblClick [
^ {
(#setup -> #setupFormOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Status_Name_DblClick).
			(#assignments -> 1).
			(#outgoingInvocations -> 7).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailscmdClearAddress_Click [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdClearAddress_Click).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailscmdCompleteOrder_Click [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdCompleteOrder_Click).
			(#assignments -> 1).
			(#outgoingInvocations -> 5).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailscmdCreateInvoice_Click [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdCreateInvoice_Click).
			(#assignments -> 3).
			(#outgoingInvocations -> 14).
			(#localVariables -> 3).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailscmdDeleteOrder_Click [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdDeleteOrder_Click).
			(#assignments -> 1).
			(#outgoingInvocations -> 7).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'order details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormOrderDetailscmdShipOrder_Click [
^ {
(#setup -> #setupFormOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdShipOrder_Click).
			(#assignments -> 2).
			(#outgoingInvocations -> 8).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsFRemovePurchaseLineItems [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #FRemovePurchaseLineItems).
			(#assignments -> 0).
			(#outgoingInvocations -> 6).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsForm_Current [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Form_Current).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsGetPurchaseDetailsSubform [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #GetPurchaseDetailsSubform).
			(#assignments -> 0).
			(#outgoingInvocations -> 0).
			(#localVariables -> 0).
			(#return -> #'Form_Purchases Subform for Purchase Order Details').
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsInitFormState [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #InitFormState).
			(#assignments -> 18).
			(#outgoingInvocations -> 3).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsPurchaseContainsLineItems [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #PurchaseContainsLineItems).
			(#assignments -> 0).
			(#outgoingInvocations -> 0).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsPurchaseOrderIsValid [
	^ {(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #PurchaseOrderIsValid).
			(#assignments -> 1).
			(#outgoingInvocations -> 10).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsPurchaseOrder_ContainsPostedInventory [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #PurchaseOrder_ContainsPostedInventory).
			(#assignments -> 0).
			(#outgoingInvocations -> 3).
			(#localVariables -> 1).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubForm_AfterInsert [
	^ {(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Form_AfterInsert).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubForm_BeforeUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Form_BeforeUpdate ).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubInitParentState [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #InitParentState).
			(#assignments -> 1).
			(#outgoingInvocations -> 1).
			(#localVariables -> 1).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubProduct_ID_AfterUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Product_ID_AfterUpdate ).
			(#assignments -> 1).
			(#outgoingInvocations -> 3).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubQuantity_AfterUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Quantity_AfterUpdate ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubQuantity_BeforeUpdate [
	^ {(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Quantity_BeforeUpdate).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubRemoveCurrentLineItem [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #RemoveCurrentLineItem ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #Boolean).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSubUnit_Cost_BeforeUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Unit_Cost_BeforeUpdate ).
			(#assignments -> 1).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSupplier_ID_AfterUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Supplier_ID_AfterUpdate).
			(#assignments -> 1).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsSupplier_ID_BeforeUpdate [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #Supplier_ID_BeforeUpdate).
			(#assignments -> 3).
			(#outgoingInvocations -> 6).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#Integer})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailsTabCtlPurchasing_Change [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #TabCtlPurchasing_Change).
			(#assignments -> 0).
			(#outgoingInvocations -> 4).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailscmdApprovePurchase_Click [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdApprovePurchase_Click).
			(#assignments -> 0).
			(#outgoingInvocations -> 9).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailscmdCancelPurchase_Click [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdCancelPurchase_Click).
			(#assignments -> 0).
			(#outgoingInvocations -> 7).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailscmdClose_Click [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdClose_Click).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Purchase Order Details' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormPurchaseOrderDetailscmdSubmitforApproval_Click [
^ {
(#setup -> #setupFormPurchaseOrderDetails).
	(#fixture
		->
			{(#functionOrSub -> #cmdSubmitforApproval_Click).
			(#assignments -> 3).
			(#outgoingInvocations -> 6).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Receiving Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormReceivingOrderDetailsSubDate_Received_AfterUpdate [
	^ {(#setup -> #setupFormReceivingOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Date_Received_AfterUpdate).
			(#assignments -> 1).
			(#outgoingInvocations -> 3).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Receiving Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormReceivingOrderDetailsSubForm_Current [
	^ {(#setup -> #setupFormReceivingOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Form_Current).
			(#assignments -> 1).
			(#outgoingInvocations -> 0).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Receiving Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormReceivingOrderDetailsSubForm_Load [
^ {
(#setup -> #setupFormReceivingOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Form_Load ).
			(#assignments -> 1).
			(#outgoingInvocations -> 5).
			(#localVariables -> 1 ).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Receiving Order Details Sub' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormReceivingOrderDetailsSubPosted_To_Inventory_AfterUpdate [
^ {
(#setup -> #setupFormReceivingOrderDetailsSub).
	(#fixture
		->
			{(#functionOrSub -> #Posted_To_Inventory_AfterUpdate ).
			(#assignments -> 8).
			(#outgoingInvocations -> 12).
			(#localVariables -> 3).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportForm_Load [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #Form_Load ).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportGetLastOrderDate [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #GetLastOrderDate ).
			(#assignments -> 0).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #Date).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportInitFilterItems [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #InitFilterItems ).
			(#assignments -> 2).
			(#outgoingInvocations -> 2).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportPrintReports [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #PrintReports ).
			(#assignments -> 7).
			(#outgoingInvocations -> 17).
			(#localVariables -> 3).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#AcView})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportSetSalesPeriod [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #SetSalesPeriod ).
			(#assignments -> 5).
			(#outgoingInvocations -> 0).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {#SalesPeriodEnum})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportcmdPreview_Click [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #cmdPreview_Click ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportcmdPrint_Click [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #cmdPrint_Click ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportlstSalesPeriod_AfterUpdate [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #lstSalesPeriod_AfterUpdate ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'Form Sales Report' }
AlceNorthwindFormSyntacticCountingTest class >> setupFormSalesReportlstSalesReports_AfterUpdate [
^ {
(#setup -> #setupFormSalesReport).
	(#fixture
		->
			{(#functionOrSub -> #lstSalesReports_AfterUpdate ).
			(#assignments -> 0).
			(#outgoingInvocations -> 1).
			(#localVariables -> 0).
			(#return -> #SubsDoNotReturn).
			(#parameters -> {})})}
]

{ #category : #'building suites' }
AlceNorthwindFormSyntacticCountingTest class >> testParameters [
	^ super testParameters
		addCase: self setupFormSalesReportSetSalesPeriod;
		addCase: self setupFormPurchaseOrderDetailsSupplier_ID_BeforeUpdate;
		addCase: self setupFormPurchaseOrderDetailsSubQuantity_AfterUpdate;
		addCase: self setupFormReceivingOrderDetailsSubPosted_To_Inventory_AfterUpdate;
		addCase: self setupFormPurchaseOrderDetailscmdClose_Click;
		addCase: self setupFormPurchaseOrderDetailsSubQuantity_BeforeUpdate;
		addCase: self setupFormOrderDetailscmdCompleteOrder_Click;
		addCase: self setupFormOrderDetailsSubQuantity_AfterUpdate;
		addCase: self setupFormPurchaseOrderDetailsPurchaseOrderIsValid;
		addCase: self setupFormSalesReportForm_Load;
		addCase: self setupFormOrderDetailsClearShippingAddress;
		addCase:
			self
				setupFormPurchaseOrderDetailsPurchaseOrder_ContainsPostedInventory;
		addCase: self setupFormReceivingOrderDetailsSubForm_Load;
		addCase: self setupFormOrderDetailsForm_Current;
		addCase: self setupFormPurchaseOrderDetailsTabCtlPurchasing_Change;
		addCase: self setupFormOrderDetailscmdCreateInvoice_Click;
		addCase: self setupFormSalesReportcmdPreview_Click;
		addCase: self setupFormSalesReportcmdPrint_Click;
		addCase: self setupFormPurchaseOrderDetailsGetPurchaseDetailsSubform;
		addCase: self setupFormOrderDetailsCustomer_ID_AfterUpdate;
		addCase: self setupFormOrderDetailsSubForm_Current;
		addCase: self setupFormInventoryListcmdPurchase_Click;
		addCase: self setupFormPurchaseOrderDetailsPurchaseContainsLineItems;
		addCase: self setupFormPurchaseOrderDetailscmdCancelPurchase_Click;
		addCase: self setupFormOrderDetailscmdShipOrder_Click;
		addCase: self setupFormPurchaseOrderDetailsSubForm_AfterInsert;
		addCase: self setupFormPurchaseOrderDetailsSubProduct_ID_AfterUpdate;
		addCase: self setupFormPurchaseOrderDetailsForm_Current;
		addCase: self setupFormPurchaseOrderDetailsInitFormState;
		addCase: self setupFormSalesReportInitFilterItems;
		addCase: self setupFormOrderDetailsSetDefaultShippingAddress;
		addCase: self setupFormPurchaseOrderDetailscmdSubmitforApproval_Click;
		addCase: self setupFormOrderDetailscmdClearAddress_Click;
		addCase: self setupFormPurchaseOrderDetailsSubInitParentState;
		addCase: self setupFormPurchaseOrderDetailsFRemovePurchaseLineItems;
		addCase: self setupFormPurchaseOrderDetailsSubForm_BeforeUpdate;
		addCase: self setupFormOrderDetailscmdDeleteOrder_Click;
		addCase: self setupFormSalesReportlstSalesReports_AfterUpdate;
		addCase: self setupFormSalesReportPrintReports;
		addCase: self setupFormPurchaseOrderDetailsSubUnit_Cost_BeforeUpdate;
		addCase: self setupFormOrderDetailsForm_Load;
		addCase: self setupFormOrderDetailsSubProduct_ID_AfterUpdate;
		addCase: self setupFormPurchaseOrderDetailsSubRemoveCurrentLineItem;
		addCase: self setupFormPurchaseOrderDetailsSupplier_ID_AfterUpdate;
		addCase: self setupFormSalesReportlstSalesPeriod_AfterUpdate;
		addCase: self setupFormReceivingOrderDetailsSubForm_Current;
		addCase: self setupFormReceivingOrderDetailsSubDate_Received_AfterUpdate;
		addCase: self setupFormSalesReportGetLastOrderDate;
		addCase: self setupFormOrderDetailsSubStatus_Name_DblClick;
		addCase: self setupFormPurchaseOrderDetailscmdApprovePurchase_Click
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"

	"
	actual = expected
		ifFalse: [ (self class class methods
				detect: [ :m | 
					| sc |
					sc := m sourceCode.
					(sc includesSubstring: setup)
						and: [ sc includesSubstring: '#' , (fixture at: #functionOrSub) ] ])
				browse ]."

	^ self
		assert: actual = expected
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> assertIfFunction: aBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^ self skip ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testAllLocalVariablesHaveName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a name isString and: [ a name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testAllLocalVariablesHaveTypeName [
	self
		assert: self functionOrSub localVariables
		allSatisfy: [ :a | a typeName isString and: [ a typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testAllTheAccessesHaveAttributeName [
	self
		assert: self functionOrSub accesses
		allSatisfy: [ :a | a rightElementName  isValidName and: [ a rightElementName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testAllTheInvocationsHaveSelector [
	self
		assert: self functionOrSub outgoingInvocations
		allSatisfy: [ :a | a selector isString ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionHasExpectedAmountParameters [
	self
		assert: self functionOrSub parameters size
		equals: (fixture at: #parameters) size
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionHasNoneIncomingInvocationBeforeBindingPhase [
	self assert: self functionOrSub incomingInvocations isEmpty
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionHasParameters [
	self functionOrSub parameters asOrderedCollection
		with: (fixture at: #parameters)
		do: [ :p :pt | self assert: p typeName equals: pt ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionParametersHaveName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p name isString and: [ p name isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionParametersHaveTypeName [
	self
		assert: self functionOrSub parameters
		allSatisfy: [ :p | p typeName isString and: [ p typeName isNotEmpty ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinedFunctionReturnsBoolean [
	self
		assertIfFunction: [ self
				assert: self functionOrSub typeName
				equals: (fixture at: #return).
			true ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinesFunction [
	self
		assert:
			(self module invocables
				anySatisfy: [ :f | f selector = (fixture at: #functionOrSub) ])
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinesHasAssignments [
	self
		assert: (self functionOrSub accesses select: #isWriting) size
		equals: (fixture at: #assignments)
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinesHasOutgoingInvocation [
	self
		assert: self functionOrSub outgoingInvocations size
		equals: (fixture at: #outgoingInvocations)
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testDefinesHasVariables [
	self
		assert: self functionOrSub localVariables size
		equals: (fixture at: #localVariables)
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testFunctionReturnsType [
	self
		assertIfFunction: [ self functionOrSub typeName isString ]
		ifFalse: [ (fixture at: #return) = #SubsDoNotReturn ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testIfInvocationExpressionContainsAPointIsMessageSend [
	| isMessageSend |
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			isMessageSend := inv selector includes: $..
			self assert: inv isVBMessageSend equals: isMessageSend ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testMessageSendMustReturnReceiverIfNotError [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver class equals: AlcixAccess  ]
				ifFalse: [ self should: [ inv receiver ] raise: Error ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testMethodInvocationMustHaveAPointAndOthersMustHaveNotPoint [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver rightElementName isNotEmpty.
					self assert: (inv selector includes: $.) ]
				ifFalse: [ self deny: (inv selector includes: $.) ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindFormSyntacticCountingTest >> testSelectorIsCalculatedFromInvocationExpression [
	self functionOrSub outgoingInvocations
		do: [ :inv | 
			inv isVBMessageSend
				ifTrue: [ self assert: inv receiver asString equals: inv selector ]
				ifFalse: [ self assert: (inv selector indexOf: $.) equals: 0 ] ]
]
