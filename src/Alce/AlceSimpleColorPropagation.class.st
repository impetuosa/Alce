Class {
	#name : #AlceSimpleColorPropagation,
	#superclass : #AlceColoringStrategy,
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlceSimpleColorPropagation >> colorFor: anEntity [

	self askForAcceptTo: anEntity.


	^ colors at: anEntity
]

{ #category : #'as yet unclassified' }
AlceSimpleColorPropagation >> colorTagFor: anAlcixAttribute or: aFullBlockClosure [

	^ anAlcixAttribute allTags
		  ifEmpty: [  colors at: anAlcixAttribute put: aFullBlockClosure value ]
		  ifNotEmpty: [ :a | colors at: anAlcixAttribute put: a first color ]
]

{ #category : #'as yet unclassified' }
AlceSimpleColorPropagation >> colorTagOr: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceSimpleColorPropagation >> colorsFor: anEntity [

	^ { (self colorFor: anEntity) }
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAccess: anAlcixAccess [

	^ self colorTagFor: anAlcixAccess or: [ 
		  anAlcixAccess candidates
			  ifEmpty: [ Color transparent ]
			  ifNotEmpty: [ self colorFor: anAlcixAccess candidates first ] ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAccessModule: anAlcixAccessModule [

	^ self
		  colorTagFor: anAlcixAccessModule
		  or: [ self colorFor: anAlcixAccessModule project ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAccessProject: anAlcixAccessProject [

	^ self colorTagFor: anAlcixAccessProject or: [ Color transparent ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAlias: anAlcixAlias [

	^ self
		  colorTagFor: anAlcixAlias
		  or: [ self colorFor: anAlcixAlias container ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAssignment: anAlcixAssignment [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAttribute: anAlcixAttribute [

	^ self
		  colorTagFor: anAlcixAttribute
		  or: [ self colorFor: anAlcixAttribute userType ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitClass: anAlcixClass [ 
	^ self visitUserType: anAlcixClass
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitConstant: anAlcixConstant [

	^ self
		  colorTagFor: anAlcixConstant
		  or: [ self colorFor: anAlcixConstant owner ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitEnum: anAlcixEnum [

	^ self
		  colorTagFor: anAlcixEnum
		  or: [ self colorFor: anAlcixEnum container ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitEnumValue: anAlcixEnumValue [

	^ self
		  colorTagFor: anAlcixEnumValue
		  or: [ self colorFor: anAlcixEnumValue enum ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitForm: anAlcixForm [

	^ self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitFunction: anAlcixFunction [

	^ self
		  colorTagFor: anAlcixFunction
		  or: [ self colorFor: anAlcixFunction userType ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitLibrary: anAlcixLibrary [

	^ self colorTagFor: anAlcixLibrary or: [ Color transparent ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitLiteral: anAlcixLiteral [

	^ self colorTagFor: anAlcixLiteral or: [ Color transparent ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitLocalVariable: anAlcixLocalVariable [

	^ self
		  colorTagFor: anAlcixLocalVariable
		  or: [ self colorFor: anAlcixLocalVariable invocable ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitModel: anAlcixModel [

	^ self
		  colorTagFor: anAlcixModel
		  or: [ self colorFor: anAlcixModel project ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitModule: anAlcixModule [

	^ self visitUserType: anAlcixModule
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitParameter: anAlcixParameter [

	^ self
		  colorTagFor: anAlcixParameter
		  or: [ self colorFor: anAlcixParameter type ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitPrimitiveType: anAlcixPrimitiveType [

	^ self visitUserType: anAlcixPrimitiveType
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitQuery: anAlcixQuery [

	^ self visitTable: anAlcixQuery
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitReport: anAlcixReport [

	^ self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitSubProcedure: anAlcixSubProcedure [

	^ self
		  colorTagFor: anAlcixSubProcedure
		  or: [ self colorFor: anAlcixSubProcedure userType ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitTable: anAlcixTable [

	^ self visitClass: anAlcixTable
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitUnknownElement: anAlcixUnknownElement [

	^ self colorTagFor: anAlcixUnknownElement or: [ Color transparent ]
]

{ #category : #visiting }
AlceSimpleColorPropagation >> visitUserType: anAlcixClass [

	^ self
		  colorTagFor: anAlcixClass
		  or: [ self colorFor: anAlcixClass container ]
]
