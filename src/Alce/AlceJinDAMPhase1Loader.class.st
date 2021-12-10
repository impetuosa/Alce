"
aJinDAMObject

	^ self instantiate: Alcix for: aJinDAMObject with: [ :obj | ]
"
Class {
	#name : #AlceJinDAMPhase1Loader,
	#superclass : #Object,
	#instVars : [
		'loader'
	],
	#category : #'Alce-Generator'
}

{ #category : #'as yet unclassified' }
AlceJinDAMPhase1Loader >> instantiate: aClass for: aJinDAMAccessModule with: aFullBlockClosure [

	| instance |
	instance := loader alce instantiate: aClass.
	instance anchor: aJinDAMAccessModule anchor.
	aFullBlockClosure cull: instance.
	loader register: instance for: aJinDAMAccessModule.
	^ instance
]

{ #category : #running }
AlceJinDAMPhase1Loader >> runOn: anAlceJinDAMTwoPhaseLoader [

	loader := anAlceJinDAMTwoPhaseLoader.
	loader dam entities do: [ :e | e accept: self ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAccessModule: aJinDAMAccessModule [

	^ self
		  instantiate: AlcixAccessModule
		  for: aJinDAMAccessModule
		  with: [ :module | 
			  module name: aJinDAMAccessModule name.
			  module path: aJinDAMAccessModule path ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAccessRead: aJinDAMObject [

	"^ self instantiate: AlcixAccess for: aJinDAMObject with: [ :obj | ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAccessWrite: aJinDAMObject [

	"^ self
		  instantiate: AlcixAssignment
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj isReturn: aJinDAMObject isReturn.
			  obj isNewObject: aJinDAMObject isNewObject ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAlias: aJinDAMObject [

	^ self instantiate: AlcixAlias for: aJinDAMObject with: [ :obj | obj name: aJinDAMObject name   ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitArgument: aJinDAMObject [

	^ self instantiate: AlcixArgument for: aJinDAMObject with: [ :obj | obj value: aJinDAMObject text ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAttribute: aJinDAMObject [

	^ self
		  instantiate: AlcixAttribute
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj name: aJinDAMObject name.
			  obj instantiatesObjectOnDefinition:
				  aJinDAMObject instantiatesObjectOnDefinition.
			  obj visibility: aJinDAMObject visibility ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitAttributeAccessor: aJinDAMObject [

	^ self
		  instantiate: AlcixAttributeAccessor
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj selector: aJinDAMObject selector.
			  obj kind: aJinDAMObject kind.
			  obj visibility: aJinDAMObject visibility ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitClass: aJinDAMObject [

	^ self instantiate: AlcixClass for: aJinDAMObject with: [ :obj | 
		  obj stringContent: aJinDAMObject src. 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitCollection: aCollection [

	aCollection do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitConstant: aJinDAMObject [

	^ self
		  instantiate: AlcixConstant
		  for: aJinDAMObject
		  with: [ :obj | obj name: aJinDAMObject name ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitDBType: aJinDAMObject [

	^ self
		  instantiate: AlcixDatabaseType
		  for: aJinDAMObject
		  with: [ :obj | obj name: aJinDAMObject name ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitEnum: aJinDAMObject [

	^ self instantiate: AlcixEnum for: aJinDAMObject with: [ :obj | 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitEnumValue: aJinDAMObject [

	^ self instantiate: AlcixEnumValue for: aJinDAMObject with: [ :obj | 
		obj name: aJinDAMObject name.
		obj value: aJinDAMObject value 	
	]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitEvent: aJinDAMObject [

	^ self
		  instantiate: AlcixEvent
		  for: aJinDAMObject
		  with: [ :obj | obj selector: aJinDAMObject selector ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitExpressionReference: aJinDAMObject [
	"^ self
		  instantiate: AlcixExpression
		  for: aJinDAMObject
		  with: [ :obj |  ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitExternalFunction: aJinDAMObject [

	^ self
		  instantiate: AlcixExternalFunction
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj selector: aJinDAMObject selector.
			  obj visibility: aJinDAMObject visibility.
			  obj alias: aJinDAMObject alias.
			  obj libraryName: aJinDAMObject libraryName ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitExternalSubProcedure: aJinDAMObject [

	^ self
		  instantiate: AlcixExternalSubProcedure 
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj selector: aJinDAMObject selector.
			  obj visibility: aJinDAMObject visibility.
			  obj alias: aJinDAMObject alias.
			  obj libraryName: aJinDAMObject libraryName ] 

	


]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitForm: aJinDAMObject [

	^ self instantiate: AlcixForm for: aJinDAMObject with: [ :obj | 
		  obj stringContent: aJinDAMObject src.
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitFunction: aJinDAMObject [

	^ self instantiate: AlcixFunction for: aJinDAMObject with: [ :obj | 
		obj selector: aJinDAMObject selector. 
		obj visibility: aJinDAMObject visibility. 
		]
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase1Loader >> visitInitializeProcess: aJinDAMInitializeProcess [

	self visitSubProcedure: aJinDAMInitializeProcess
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitLibrary: aJinDAMObject [

	^ self instantiate: AlcixLibrary for: aJinDAMObject with: [ :obj | 
		  obj name: aJinDAMObject name.
		  obj path: aJinDAMObject path.
		  obj isBuiltIn: aJinDAMObject isBuiltIn ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitLibraryReference: aJinDAMObject [

"	^ self
		  instantiate: AlcixAccess
		  for: aJinDAMObject
		  with: [ :obj | obj name: aJinDAMObject name ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitLiteralReference: aJinDAMObject [

	^ self instantiate: AlcixLiteral for: aJinDAMObject with: [ :obj | 
		  obj kind: aJinDAMObject literalKind .
		  obj value: aJinDAMObject candidate ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitLocalVariable: aJinDAMObject [

	^ self
		  instantiate: AlcixLocalVariable
		  for: aJinDAMObject
		  with: [ :obj | obj name: aJinDAMObject name ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitMemberReference: aJinDAMObject [

	aJinDAMObject candidate ifNotNil: [ :c | "^ self instantiate: AlcixAccess for: aJinDAMObject with: [ :obj | obj name: aJinDAMObject name ]" 
		c accept: self ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitModule: aJinDAMObject [

	^ self instantiate: AlcixModule for: aJinDAMObject with: [ :obj | 
		 obj stringContent: aJinDAMObject src. 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitMultipleTypeReference: aJinDAMObject [

"	^ self
		  instantiate: AlcixAccess
		  for: aJinDAMObject
		  with: [ :obj | obj name: aJinDAMObject name ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitParameter: aJinDAMObject [

	^ self
		  instantiate: AlcixParameter
		  for: aJinDAMObject
		  with: [ :obj | 
			  obj name: aJinDAMObject name.
			  obj isOptional: aJinDAMObject isOptional ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitPrimitiveType: aJinDAMObject [

	^ self
		  instantiate: AlcixPrimitiveType 
		  for: aJinDAMObject
		  with: [ : obj | 
				obj name: aJinDAMObject name. 
		]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitQuery: aJinDAMObject [

	^ self instantiate: AlcixQuery for: aJinDAMObject with: [ :obj | 
		  obj stringContent: aJinDAMObject src.
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitReport: aJinDAMObject [

	^ self instantiate: AlcixReport for: aJinDAMObject with: [ :obj | 
		  obj stringContent: aJinDAMObject src.
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitStructure: aJinDAMObject [

	^ self instantiate: AlcixUserType for: aJinDAMObject with: [ :obj | 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitSubProcedure: aJinDAMObject [

	^ self instantiate: AlcixSubProcedure  for: aJinDAMObject with: [ :obj |
		obj selector: aJinDAMObject selector.
		obj visibility: aJinDAMObject visibility .	
	 ]
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitTable: aJinDAMObject [

	^ self instantiate: AlcixTable for: aJinDAMObject with: [ :obj | 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility.
		  obj astCannotLoad: aJinDAMObject astCannotLoad ] 
	
	
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitTableField: aJinDAMObject [

	^ self instantiate: AlcixTableField  for: aJinDAMObject with: [ :obj | 
		obj name: aJinDAMObject name. 	
		obj instantiatesObjectOnDefinition: false.
		obj visibility: #Public.
		obj size: aJinDAMObject size. 
	]
	

]

{ #category : #'+' }
AlceJinDAMPhase1Loader >> visitTableRelation: aJinDAMTableRelation [ 

]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitTypeMemberReference: aJinDAMObject [
"
	^ self instantiate: AlcixAccess for: aJinDAMObject with: [ :obj | 
		  aJinDAMObject name isString ifTrue: [ 
			  obj name: aJinDAMObject name ] ]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitTypeReference: aJinDAMObject [

	"^ self
		  instantiate: AlcixAccess 
		  for: aJinDAMObject
		  with: [ : obj | 
			obj name: aJinDAMObject name 
		]"
]

{ #category : #visiting }
AlceJinDAMPhase1Loader >> visitUserType: aJinDAMObject [

	^ self instantiate: AlcixUserType for: aJinDAMObject with: [ :obj | 
		  obj name: aJinDAMObject name.
		  obj visibility: aJinDAMObject visibility ]
]
