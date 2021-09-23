Class {
	#name : #AlceHorizontalColorPropagation,
	#superclass : #AlceColoringStrategy,
	#instVars : [
		'verticalColor'
	],
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlceHorizontalColorPropagation >> colorsFor: anEntity [
	self askForAcceptTo: anEntity.

	^ colors at: anEntity
]

{ #category : #'as yet unclassified' }
AlceHorizontalColorPropagation >> colorsFor: anAlcixClass collection: aFullBlockClosure [

	colors at: anAlcixClass ifAbsent: [ 
		colors at: anAlcixClass put: OrderedCollection new.
		aFullBlockClosure value: (colors at: anAlcixClass) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> reset [

	super reset 
	verticalColor ifNotNil: [ verticalColor reset ]
]

{ #category : #'as yet unclassified' }
AlceHorizontalColorPropagation >> selectingCategory: aSc [

	super selectingCategory: aSc.

	verticalColor ifNotNil: [ verticalColor selectingCategory: aSc ]
]

{ #category : #'as yet unclassified' }
AlceHorizontalColorPropagation >> verticalColor [

	^ verticalColor ifNil: [ 
		  verticalColor := AlceVerticalColorPropagation new.
		  verticalColor selectingCategory: selectingCategory.
		  verticalColor ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAccess: anAlcixAccess [

	self
		colorsFor: anAlcixAccess
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAccess candidates) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAccessModule: anAlcixAccessModule [

	self
		colorsFor: anAlcixAccessModule
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAccessModule types) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAccessProject: anAlcixAccessProject [

	^ self colorsFor: anAlcixAccessProject collection: [ :col | 
		  col addAll: ((self tagAssociationsFor: anAlcixAccessProject)).
		  col addAll: (self colorsForAll: anAlcixAccessProject modules) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAlias: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixAlias type).
		col addAll: (self verticalColor colorsFor: anAlcixAlias) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitArgument: anAlcixArgument [

	self colorsFor: anAlcixArgument collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixArgument).
		col addAll: (self colorsForAll: anAlcixArgument assignments).
		col addAll: (self colorsForAll: anAlcixArgument outgoingAccesses) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAssignment: anAlcixAssignment [

	self colorsFor: anAlcixAssignment collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAssignment readElements).
		col addAll: (self colorsForAll: anAlcixAssignment writeElement) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAttribute: anAlcixAttribute [

	self visitTyped: anAlcixAttribute
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitClass: anAlcixClass [

	self colorsFor: anAlcixClass collection: [ :col | 
		anAlcixClass superclass ifNotNil: [ :c | 
			col addAll: (self colorsFor: anAlcixClass superclass) ].
		col addAll: (self colorsForAll: anAlcixClass members).
		col addAll: (self colorsForAll: anAlcixClass constants).
		col addAll: (self colorsForAll: anAlcixClass invocables).
		col addAll: (self colorsForAll: anAlcixClass globalVariables) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitConstant: anAlcixConstant [

	self colorsFor: anAlcixConstant collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixConstant type).
		col addAll: (self verticalColor colorsFor: anAlcixConstant value) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitEnum: anAlcixEnum [

	self
		colorsFor: anAlcixEnum
		collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixEnum) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitEnumValue: anAlcixEnumValue [

	self colorsFor: anAlcixEnumValue collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixEnumValue enum) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitEvent: anAlcixEvent [

	self
		colorsFor: anAlcixEvent
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixEvent parameters) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitExternalFunction: anAlcixExternalFunction [

	self colorsFor: anAlcixExternalFunction collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixExternalFunction constants).
		col addAll: (self colorsForAll: anAlcixExternalFunction parameters).
		col addAll:
			(self verticalColor colorsFor: anAlcixExternalFunction type) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitExternalSubProcedure: anAlcixExternalSubProcedure [

	self colorsFor: anAlcixExternalSubProcedure collection: [ :col | 
		col addAll:
			(self colorsForAll: anAlcixExternalSubProcedure constants).
		col addAll:
			(self colorsForAll: anAlcixExternalSubProcedure parameters) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitForm: anAlcixClass [

	self visitClass: anAlcixClass
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitFunction: anAlcixSubProcedure [
	self colorsFor: anAlcixSubProcedure collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixSubProcedure localVariables).
		col addAll: (self colorsForAll: anAlcixSubProcedure constants).
		col addAll: (self colorsForAll: anAlcixSubProcedure parameters).
		col addAll: (self colorsForAll: anAlcixSubProcedure assignments).
		col addAll:
			(self colorsForAll: anAlcixSubProcedure outgoingAccesses).
		col addAll: (self verticalColor colorsFor: anAlcixSubProcedure type) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitInvocation: anAlcixInvocation [

	self colorsFor: anAlcixInvocation collection: [ :col | 
		col addAll:
			(self verticalColor colorsForAll: anAlcixInvocation candidates).
		col addAll: (self colorsForAll: anAlcixInvocation arguments) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitLibrary: anAlcixLibrary [

	self colorsFor: anAlcixLibrary collection: [ :col |  ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitLiteral: anAlcixLiteral [

	self colorsFor: anAlcixLiteral collection: [ :col |  ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitLocalVariable: anAlcixLocalVariable [

	^ self visitTyped: anAlcixLocalVariable
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitModel: anAlcixModel [

	self askForAcceptTo: anAlcixModel project.
	^ colors at: anAlcixModel project
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitModule: anAlcixClass [

	self visitUserType: anAlcixClass
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitParameter: anAlcixParameter [

	self visitTyped: anAlcixParameter
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitQuery: anAlcixQuery [

	^ self visitTable: anAlcixQuery
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitReport: anAlcixClass [

	self visitClass: anAlcixClass
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitReturn: anAlcixReturn [

	self colorsFor: anAlcixReturn collection: [ :c |  ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitSubProcedure: anAlcixSubProcedure [

	self colorsFor: anAlcixSubProcedure collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixSubProcedure localVariables).
		col addAll: (self colorsForAll: anAlcixSubProcedure constants).
		col addAll: (self colorsForAll: anAlcixSubProcedure parameters).
		col addAll: (self colorsForAll: anAlcixSubProcedure assignments).
		col addAll:
			(self colorsForAll: anAlcixSubProcedure outgoingAccesses) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitTable: anAlcixTable [ 
	 ^ self visitClass: anAlcixTable 
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitTableField: anAlcixTableField [

	^ self visitTyped: anAlcixTableField
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitTyped: anAlcixParameter [

	self colorsFor: anAlcixParameter collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixParameter type) ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitUnknownElement: anAlcixUnknownElement [

	self colorsFor: anAlcixUnknownElement collection: [ :col |  ]
]

{ #category : #visiting }
AlceHorizontalColorPropagation >> visitUserType: anAlcixClass [

	self colorsFor: anAlcixClass collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixClass members).
		col addAll: (self colorsForAll: anAlcixClass constants).
		col addAll: (self colorsForAll: anAlcixClass invocables).
		col addAll: (self colorsForAll: anAlcixClass globalVariables) ]
]
