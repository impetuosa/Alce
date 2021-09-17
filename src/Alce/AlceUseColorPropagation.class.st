Class {
	#name : #AlceUseColorPropagation,
	#superclass : #AlceColoringStrategy,
	#instVars : [
		'verticalColor'
	],
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlceUseColorPropagation >> colorsFor: anEntity [

	self askForAcceptTo: anEntity.


	^ colors at: anEntity
]

{ #category : #'as yet unclassified' }
AlceUseColorPropagation >> colorsFor: anAlcixClass collection: aFullBlockClosure [

	colors at: anAlcixClass ifAbsent: [ 
		colors at: anAlcixClass put: OrderedCollection new.
		aFullBlockClosure value: (colors at: anAlcixClass) ]
]

{ #category : #'as yet unclassified' }
AlceUseColorPropagation >> verticalColor [
	  ^ verticalColor ifNil: [ verticalColor := AlceVerticalColorPropagation new ] 
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAccess: anAlcixAccess [

	self
		colorsFor: anAlcixAccess
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAccess candidates) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAccessModule: anAlcixAccessModule [

	self
		colorsFor: anAlcixAccessModule
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAccessModule types) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAccessProject: anAlcixAccessProject [

	^ self colorsFor: anAlcixAccessProject collection: [ :col | 
		  col addAll: ((self tagsFor: anAlcixAccessProject) collect: #color).
		  col addAll: (self colorsForAll: anAlcixAccessProject modules) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAlias: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixAlias type).
		col addAll: (self verticalColor colorsFor: anAlcixAlias) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitArgument: anAlcixArgument [

	self colorsFor: anAlcixArgument collection: [ :col | 
		col addAll: ((self tagsFor: anAlcixArgument) collect: #color).
		col addAll: (self colorsForAll: anAlcixArgument assignments).
		col addAll: (self colorsForAll: anAlcixArgument outgoingAccesses) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAssignment: anAlcixAssignment [

	self colorsFor: anAlcixAssignment collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixAssignment readElements).
		col addAll: (self colorsForAll: anAlcixAssignment writeElement) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAttribute: anAlcixAttribute [

	self visitTyped: anAlcixAttribute
]

{ #category : #visiting }
AlceUseColorPropagation >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceUseColorPropagation >> visitClass: anAlcixClass [

	self colorsFor: anAlcixClass collection: [ :col | 
		anAlcixClass superclass ifNotNil: [ :c | 
			col addAll: (self colorsFor: anAlcixClass superclass) ].
		col addAll: (self colorsForAll: anAlcixClass members).
		col addAll: (self colorsForAll: anAlcixClass constants).
		col addAll: (self colorsForAll: anAlcixClass invocables).
		col addAll: (self colorsForAll: anAlcixClass globalVariables) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitConstant: anAlcixConstant [

	self colorsFor: anAlcixConstant collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixConstant type).
		col addAll: (self verticalColor colorsFor: anAlcixConstant value) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitEnum: anAlcixEnum [

	self
		colorsFor: anAlcixEnum
		collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixEnum) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitEnumValue: anAlcixEnumValue [

	self colorsFor: anAlcixEnumValue collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixEnumValue enum) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitEvent: anAlcixEvent [

	self
		colorsFor: anAlcixEvent
		collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixEvent parameters) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitExternalFunction: anAlcixExternalFunction [

	self colorsFor: anAlcixExternalFunction collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixExternalFunction constants).
		col addAll: (self colorsForAll: anAlcixExternalFunction parameters).
		col addAll:
			(self verticalColor colorsFor: anAlcixExternalFunction type) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitExternalSubProcedure: anAlcixExternalSubProcedure [

	self colorsFor: anAlcixExternalSubProcedure collection: [ :col | 
		col addAll:
			(self colorsForAll: anAlcixExternalSubProcedure constants).
		col addAll:
			(self colorsForAll: anAlcixExternalSubProcedure parameters) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitForm: anAlcixClass [

	self visitClass: anAlcixClass
]

{ #category : #visiting }
AlceUseColorPropagation >> visitFunction: anAlcixSubProcedure [

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
AlceUseColorPropagation >> visitInvocation: anAlcixInvocation [

	self colorsFor: anAlcixInvocation collection: [ :col | 
		col addAll:
			(self verticalColor colorsForAll: anAlcixInvocation candidates).
		col addAll: (self colorsForAll: anAlcixInvocation arguments) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitLibrary: anAlcixLibrary [

	self colorsFor: anAlcixLibrary collection: [ :col |  ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitLiteral: anAlcixLiteral [

	self colorsFor: anAlcixLiteral collection: [ :col |  ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitLocalVariable: anAlcixLocalVariable [

	^ self visitTyped: anAlcixLocalVariable
]

{ #category : #visiting }
AlceUseColorPropagation >> visitModel: anAlcixModel [

	self askForAcceptTo: anAlcixModel project.
	^ colors at: anAlcixModel project
]

{ #category : #visiting }
AlceUseColorPropagation >> visitModule: anAlcixClass [

	self visitUserType: anAlcixClass
]

{ #category : #visiting }
AlceUseColorPropagation >> visitParameter: anAlcixParameter [

	self visitTyped: anAlcixParameter
]

{ #category : #visiting }
AlceUseColorPropagation >> visitReport: anAlcixClass [

	self visitClass: anAlcixClass
]

{ #category : #visiting }
AlceUseColorPropagation >> visitSubProcedure: anAlcixSubProcedure [

	self colorsFor: anAlcixSubProcedure collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixSubProcedure localVariables).
		col addAll: (self colorsForAll: anAlcixSubProcedure constants).
		col addAll: (self colorsForAll: anAlcixSubProcedure parameters).
		col addAll: (self colorsForAll: anAlcixSubProcedure assignments).
		col addAll:
			(self colorsForAll: anAlcixSubProcedure outgoingAccesses) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitTyped: anAlcixParameter [

	self colorsFor: anAlcixParameter collection: [ :col | 
		col addAll: (self verticalColor colorsFor: anAlcixParameter type) ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitUnknownElement: anAlcixUnknownElement [

	self colorsFor: anAlcixUnknownElement collection: [ :col |  ]
]

{ #category : #visiting }
AlceUseColorPropagation >> visitUserType: anAlcixClass [

	self colorsFor: anAlcixClass collection: [ :col | 
		col addAll: (self colorsForAll: anAlcixClass members).
		col addAll: (self colorsForAll: anAlcixClass constants).
		col addAll: (self colorsForAll: anAlcixClass invocables).
		col addAll: (self colorsForAll: anAlcixClass globalVariables) ]
]
