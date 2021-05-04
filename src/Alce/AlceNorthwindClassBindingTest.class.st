Class {
	#name : #AlceNorthwindClassBindingTest,
	#superclass : #AlceNorthwindCachedModelAbstractTest,
	#category : #'Alce-Test-Bind'
}

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassErrorHandlingLogError [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #ErrorHandling).
	(#fixture -> {
	(#functionOrSub -> #LogError).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassErrorHandlingTryToCloseObject [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #ErrorHandling).
	(#fixture -> {
	(#functionOrSub -> #TryToCloseObject).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassErrorHandlingTryToGoToRecord [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #ErrorHandling).
	(#fixture -> {
	(#functionOrSub -> #TryToGoToRecord).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassErrorHandlingTryToRunCommand [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #ErrorHandling).
	(#fixture -> {
	(#functionOrSub -> #TryToRunCommand).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassErrorHandlingTryToSaveRecord [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #ErrorHandling).
	(#fixture -> {
	(#functionOrSub -> #TryToSaveRecord).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperAddNew [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #AddNew).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperClass_Terminate [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #Class_Terminate).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperCloseRecordset [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #CloseRecordset).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperDelete [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
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

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperEdit [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #Edit).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperGetRecordsetClone [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #GetRecordsetClone).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperMoveNext [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #MoveNext).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperOpenRecordset [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #OpenRecordset).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest class >> setupAlcixClassRecordsetWrapperUpdate [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {
	(#functionOrSub -> #Update).
	(#accessBoundAttributes -> 0) .
	(#returnTypeBindingExpected -> true) .
	(#variableTypesBound -> 0) .
	(#variableBound -> 0) .
	(#expectedIncomingBound -> 0) .
	(#expectedOutgoingBound -> 0) 
	})}
]

{ #category : #'building suites' }
AlceNorthwindClassBindingTest class >> testParameters [
	^ super testParameters
		addCase: self setupAlcixClassErrorHandlingTryToRunCommand;
		addCase: self setupAlcixClassErrorHandlingTryToCloseObject;
		addCase: self setupAlcixClassRecordsetWrapperGetRecordsetClone;
		addCase: self setupAlcixClassRecordsetWrapperOpenRecordset;
		addCase: self setupAlcixClassRecordsetWrapperEdit;
		addCase: self setupAlcixClassRecordsetWrapperUpdate;
		addCase: self setupAlcixClassRecordsetWrapperDelete;
		addCase: self setupAlcixClassRecordsetWrapperAddNew;
		addCase: self setupAlcixClassErrorHandlingLogError;
		addCase: self setupAlcixClassRecordsetWrapperClass_Terminate;
		addCase: self setupAlcixClassRecordsetWrapperCloseRecordset;
		addCase: self setupAlcixClassRecordsetWrapperMoveNext;
		addCase: self setupAlcixClassErrorHandlingTryToGoToRecord;
		addCase: self setupAlcixClassErrorHandlingTryToSaveRecord
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> setUp [
	super setUp.
	AlceLinker link: model . 
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testAccessesAreBoundProperly [
	self
		assert: (self functionOrSub accesses select: [ :s | s attribute isNotNil ]) size
		equals: (fixture at: #accessBoundAttributes)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testBoundedReturnType [
	self functionOrSub class = AlcixSubProcedure
		ifTrue: [ ^ self skip ].
	self
		assert: self functionOrSub type isNil
		equals: (fixture at: #returnTypeBindingExpected)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testBoundedVariableTypes [
	self
		assert:
			(self functionOrSub localVariables select: [ :s | s type isNotNil ])
				size
		equals: (fixture at: #variableTypesBound)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testBoundedVariables [
	self
		assert: (self functionOrSub localVariables select: [ :s | s access isEmptyOrNil not ]) size
		equals: (fixture at: #variableBound)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testIncomingCallsAreBoundProperly [
	self
		assert: self functionOrSub incomingInvocations size
		equals: (fixture at: #expectedIncomingBound)
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testOutgoingCallsAreBoundProperly [
	self
		assert: (self functionOrSub outgoingInvocations select: [ :s | s candidate isNotNil ]) size
		equals: (fixture at: #expectedOutgoingBound) 
]
