Class {
	#name : #AlceLookUp,
	#superclass : #AlceLook,
	#instVars : [
		'lookInClass',
		'matchingReference'
	],
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceLookUp class >> lookFor: aMatch from: aNode [
	| instance |
	instance := self new.
	instance match: aMatch.
	aNode accept: instance.
	^ instance findings
]

{ #category : #'as yet unclassified' }
AlceLookUp class >> lookFor: aLookInClass matching: aMatch from: aNode [
	| instance |
	aMatch ifNil: [ ^ nil ].
	instance := self new.
	instance lookInClass: aLookInClass.
	instance matchingReference: aMatch.
	instance lookUpFrom: aNode. 

	^ instance findings
]

{ #category : #'look-in' }
AlceLookUp >> lookIn: aNode or: aBlock [
	^ self lookIn: aNode using: lookInClass or: aBlock
]

{ #category : #'look-in' }
AlceLookUp >> lookIn: aNode using: aLookInClass or: aBlock [
	| lookin |
	lookin := aLookInClass new
		match: match;
		yourself.
	lookin lookInto: aNode  .
	lookin findings
		ifNil: [ aBlock value ]
		ifNotNil: [ :f | self findings: f ]
]

{ #category : #'look-in' }
AlceLookUp >> lookInClass: aClass [
	lookInClass := aClass
]

{ #category : #'as yet unclassified' }
AlceLookUp >> lookUpFrom: aNode [

	| matchingUnits |
	matchingReference assertIsSingleName.
	"	matchingReference printString = 'rs.Clone' ifTrue: [ self halt ]."
	matchingUnits := matchingReference splitInRefs.

	match := matchingUnits first.


	aNode accept: self.

	matchingUnits size = 1 ifTrue: [ ^ self ].

	findings := matchingUnits allButFirst
		            inject: findings
		            into: [ :lastNode :each | 
			            (lastNode isNil or: [ lastNode type isNil ]) ifTrue: [ 
				            findings := nil.
				            ^ self ].
			            lastNode type members
				            detect: [ :m | each referersTo: m name ]
				            ifNone: [ 
					            lastNode type invocables
						            detect: [ :m | each referersTo: m selector ]
						            ifNone: [ 
							            lastNode type types
								            detect: [ :m | each referersTo: m name ]
								            ifNone: [ 
									            self flag:
										            #WeShouldEnsureTheBasicClassAndFormsAttributesAndMethods.
									            ^ nil ] ] ] ]
]

{ #category : #'as yet unclassified' }
AlceLookUp >> matchingReference: anAlcixVariableReference [ 
	matchingReference := anAlcixVariableReference 
]

{ #category : #visiting }
AlceLookUp >> visitAccessModule: anAccessModule [
	self lookIn: anAccessModule or: [ " nothing to do " ]
]

{ #category : #visiting }
AlceLookUp >> visitAttribute: anAlcixAttribute [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceLookUp >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceLookUp >> visitClass: anAlcixClass [ 
	self visitModule: anAlcixClass 
]

{ #category : #visiting }
AlceLookUp >> visitForm: anAlcixForm [ 
	self visitClass: anAlcixForm 
]

{ #category : #visiting }
AlceLookUp >> visitFunction: aFunction [
	self lookIn: aFunction or: [ aFunction userType accept: self ]
]

{ #category : #visiting }
AlceLookUp >> visitLibrary: anAlcixLibrary [ 
	self lookIn: anAlcixLibrary or: [ " nothing to do " ]
]

{ #category : #visiting }
AlceLookUp >> visitMethodInvocation: anAlcixMethodInvocation [
	anAlcixMethodInvocation invocable accept: self
]

{ #category : #visiting }
AlceLookUp >> visitModule: anModule [
	self lookIn: anModule or: [ anModule container accept: self ]
]

{ #category : #visiting }
AlceLookUp >> visitParameter: anAlcixParameter [

	anAlcixParameter type ifNotNil: [ :t | t accept: self ]
]

{ #category : #visiting }
AlceLookUp >> visitReport: anAlcixReport [ 
	self visitForm: anAlcixReport 
]

{ #category : #visiting }
AlceLookUp >> visitSubProcedure: anAlcixSubProcedure [
	^ self visitFunction: anAlcixSubProcedure
]

{ #category : #visiting }
AlceLookUp >> visitTypedEntity: aTypedEntity [
	^ aTypedEntity userType accept: self
]

{ #category : #visiting }
AlceLookUp >> visitUserType: anAlcixUserType [ 

]
