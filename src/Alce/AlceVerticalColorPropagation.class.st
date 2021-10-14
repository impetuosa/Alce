Class {
	#name : #AlceVerticalColorPropagation,
	#superclass : #AlceColoringStrategy,
	#category : #'Alce-Coloring'
}

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAccess: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAccessModule: anAlcixAccessModule [

	self
		colorsFor: anAlcixAccessModule
		collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixAccessModule) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAlias: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixAlias).
		col addAll: (self colorsFor: anAlcixAlias container).
		col addAll: (self colorsFor: anAlcixAlias type) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitArgument: anAlcixArgument [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAssignment: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAttribute: anAlcixAttribute [

	self visitFunction: anAlcixAttribute
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitClass: anAlcixClass [

	self colorsFor: anAlcixClass collection: [ :col | 
		anAlcixClass superclass ifNotNil: [ :c | 
			col addAll: (self colorsFor: c) ].
		col addAll: (self tagAssociationsFor: anAlcixClass).
		col addAll: (self colorsFor: anAlcixClass container) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitConstant: anAlcixConstant [
	self colorsFor: anAlcixConstant collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixConstant).
		col addAll: (self colorsFor: anAlcixConstant owner ) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitDatabaseType: anAlcixDatabaseType [

	^ self visitType: anAlcixDatabaseType
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitEnum: anAlcixEnum [

	^ self visitType: anAlcixEnum
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitEnumValue: anAlcixEnumValue [ 

	self colorsFor: anAlcixEnumValue collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixEnumValue).
		col addAll: (self colorsFor: anAlcixEnumValue enum) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitEvent: anAlcixEvent [

	^ self visitFunction: anAlcixEvent
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitExternalFunction: anAlcixExternalFunction [

	self visitFunction: anAlcixExternalFunction
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitExternalSubProcedure: anAlcixExternalSubProcedure [

	self visitSubProcedure: anAlcixExternalSubProcedure
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitForm: anAlcixReport [

	^ self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitFunction: anAlcixFunction [

	self colorsFor: anAlcixFunction collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixFunction).
		col addAll: (self colorsFor: anAlcixFunction userType) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitInvocation: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitLibrary: anAlcixLibrary [

	self
		colorsFor: anAlcixLibrary
		collection: [ :col | col addAll: (self tagAssociationsFor: anAlcixLibrary) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitLocalVariable: anAlcixLocalVariable [ 
	 ^ self visitTyped: anAlcixLocalVariable
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitModule: anAlcixModule [

	^ self visitType: anAlcixModule
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitParameter: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitPrimitiveType: anAlcixPrimitiveType [

	self visitType: anAlcixPrimitiveType
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitQuery: anAlcixReport [

	^ self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitReport: anAlcixReport [

	^ self visitForm: anAlcixReport
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitReturn: anAlcixReturn [

	self colorsFor: anAlcixReturn collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitSubProcedure: anAlcixSubProcedure [

	^ self visitFunction: anAlcixSubProcedure
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitTable: anAlcixReport [

	^ self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitTableField: anAlcixAttribute [

	self visitFunction: anAlcixAttribute
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitType: anAlcixPrimitiveType [

	self colorsFor: anAlcixPrimitiveType collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixPrimitiveType).
		col addAll: (self colorsFor: anAlcixPrimitiveType container) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitTyped: anAlcixLocalVariable [

	self colorsFor: anAlcixLocalVariable collection: [ :col | 
		col addAll: (self tagAssociationsFor: anAlcixLocalVariable).
		col addAll: (self colorsFor: anAlcixLocalVariable invocable) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitUndefinedElement: anAlcixUndefinedElement [

	self visitType: anAlcixUndefinedElement
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitUnknownElement: anAlcixUnknownElement [

	self colorsFor: anAlcixUnknownElement collection: [ :col |  ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitUserType: anAlcixUserType [

	^ self visitType: anAlcixUserType
]

{ #category : #accessing }
AlceVerticalColorPropagation >> visited [

	^ visited
]
