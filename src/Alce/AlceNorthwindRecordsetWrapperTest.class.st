Class {
	#name : #AlceNorthwindRecordsetWrapperTest,
	#superclass : #AlceNorthwindCachedModelAbstractTest,
	#category : #'Alce-Test-Bind'
}

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> addNew [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #AddNew ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> assert: aCollection anySatisfy: aBlock [

	self assert: aCollection isNotEmpty description: 'The collection is emtpy. This tests make no sense'.
	self assert: (aCollection anySatisfy: aBlock) description: 'None element in the collection satisfies ', aBlock asString
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> classTerminate [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #Class_Terminate ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> closeRecordset [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #CloseRecordset ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> delete [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #Delete ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> edit [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #Edit ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> getRecordsetClone [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #GetRecordsetClone ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> moveNext [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #MoveNext ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> mrs [
	^ self recordsetWrapper members first
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> openRecordset [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #OpenRecordset ]
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> recordsetWrapper [

	^ model detect: [ :e | e name = 'RecordsetWrapper' ]
]

{ #category : #'set up' }
AlceNorthwindRecordsetWrapperTest >> setUp [
	super setUp.
	AlceLinker link: model . 
]

{ #category : #'class test' }
AlceNorthwindRecordsetWrapperTest >> testAllIncomingInvocationsAreMessageSend [

	self recordsetWrapper invocables allSatisfy: [ :i | 
		i incomingInvocations allSatisfy: [ :in | in isVBMessageSend ] ]
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testAttributeTypeIsDaoRecordset2 [
	self assert: self mrs type container name equals: #DAO. 
	self assert: self mrs type name equals: #Recordset2. 
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testAttributeTyped [
	self assert: self mrs type isNotNil
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMember [
	self assert: self recordsetWrapper members size equals: 1
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNameIsMRS [
	self assert: self recordsetWrapper members first name equals: 'm_rs'
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNameIsMRSWith17Usages [
	self assert: self mrs access size equals: 17
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNameIsMRSWith4WrittingUsages [
	self
		assert: (self mrs writingAccesses select: [ :a | a isWriting ]) size
		equals: 4
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNameIsMRSWithOnlyInClassUsages [

	self assert:
		(self mrs  access allSatisfy: [ :a | 
			 a invocable userType = self recordsetWrapper ])
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNamedMRSHasOnlyGetterAccessor [
	self assert: self mrs attributeAccessors first kind equals:#Get
]

{ #category : #'test attribute' }
AlceNorthwindRecordsetWrapperTest >> testClassHasOneAttributeMemberNamedMRSHasOnlyOneAccessor [
	self assert: self mrs attributeAccessors size equals: 1
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneAccessesMrs2Times [
	self assert: (self getRecordsetClone accesses select: [ : a | a attribute = self mrs ])size equals: 1
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneHas1OutgoingInvocationsToParameter [

	self
		assert: self getRecordsetClone outgoingInvocations
		anySatisfy: [ :oi | 
		oi receiver = self getRecordsetClone parameters first ]
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneHas2Accesses [
	self assert: self getRecordsetClone accesses size equals: 2
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneHas2OutgoingInvocations [

	self
		assert: self getRecordsetClone outgoingInvocations size
		equals: 2
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneParameterTypeDAORecordset2Type [
	self assert: self getRecordsetClone parameters first container name equals: #DAO.
	self assert: self getRecordsetClone parameters first type name equals: #Recordset2
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneReturnsDAORecordset2Type [
	self assert: self getRecordsetClone type container name equals: #DAO.
	self assert: self getRecordsetClone type name equals: #Recordset2
]

{ #category : #'test functions recordset clone' }
AlceNorthwindRecordsetWrapperTest >> testGetRecordsetCloneWritesOnceOnMrs [

	self
		assert:
		(self getRecordsetClone accesses select: [ :i | i isWriting ]) size
		equals: 1
]

{ #category : #'class test' }
AlceNorthwindRecordsetWrapperTest >> testRecordsetWrapperHas1Subprocedure [
	self
		assert: (self recordsetWrapper invocables select: [ :i | 
				 i isKindOf: AlcixSubProcedure ]) size
		equals: 1
]

{ #category : #'class test' }
AlceNorthwindRecordsetWrapperTest >> testRecordsetWrapperHas8Functions [
	self
		assert: (self recordsetWrapper invocables select: [ :i | 
				 i isKindOf: AlcixFunction ]) size
		equals: 8
]

{ #category : #'class test' }
AlceNorthwindRecordsetWrapperTest >> testRecordsetWrapperIsAClass [
 	self assert: self recordsetWrapper isAlcixClass
]

{ #category : #helpers }
AlceNorthwindRecordsetWrapperTest >> update [

	^ self recordsetWrapper invocables detect: [ :i | 
		  i selector = #Update ]
]
