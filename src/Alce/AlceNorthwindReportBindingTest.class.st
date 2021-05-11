Class {
	#name : #AlceNorthwindReportBindingTest,
	#superclass : #AlceNorthwindCachedModelAbstractTest,
	#category : #'Alce-Test-Bind'
}

{ #category : #'as yet unclassified' }
AlceNorthwindReportBindingTest class >> setupAlcixReportMonthlySalesReportReport_Open [
	^ {(#kind -> AlcixReport).
	(#nameOfFSTCitizen -> #'Monthly Sales Report').
	(#fixture -> {
	(#functionOrSub -> #Report_Open).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportBindingTest class >> setupAlcixReportQuarterlySalesReportReport_Open [
	^ {(#kind -> AlcixReport).
	(#nameOfFSTCitizen -> #'Quarterly Sales Report').
	(#fixture -> {
	(#functionOrSub -> #Report_Open).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportBindingTest class >> setupAlcixReportYearlySalesReportReport_Open [
	^ {(#kind -> AlcixReport).
	(#nameOfFSTCitizen -> #'Yearly Sales Report').
	(#fixture -> {
	(#functionOrSub -> #Report_Open).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindReportBindingTest class >> testParameters [
	^ super testParameters
		addCase: self setupAlcixReportYearlySalesReportReport_Open;
		addCase: self setupAlcixReportQuarterlySalesReportReport_Open;
		addCase: self setupAlcixReportMonthlySalesReportReport_Open
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testAccessesAreBoundProperly [
	self
		assert: (self functionOrSub accesses select: [ :s | s attribute isNotNil ]) size
		equals: (fixture at: #accessBoundAttributes)
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testBoundedReturnType [
	self functionOrSub class = AlcixSubProcedure
		ifTrue: [ ^ self skip ].
	self
		assert: self functionOrSub type isNil
		equals: (fixture at: #returnTypeBindingExpected)
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testBoundedVariableTypes [
	self
		assert:
			(self functionOrSub localVariables select: [ :s | s type isNotNil ])
				size
		equals: (fixture at: #variableTypesBound)
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testBoundedVariables [
	self
		assert: (self functionOrSub localVariables select: [ :s | s access isEmptyOrNil not ]) size
		equals: (fixture at: #variableBound)
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testIncomingCallsAreBoundProperly [
	self
		assert: self functionOrSub incomingInvocations size
		equals: (fixture at: #expectedIncomingBound)
]

{ #category : #tests }
AlceNorthwindReportBindingTest >> testOutgoingCallsAreBoundProperly [
	self
		assert: (self functionOrSub outgoingInvocations select: [ :s | s candidate isNotNil ]) size
		equals: (fixture at: #expectedOutgoingBound) 
]