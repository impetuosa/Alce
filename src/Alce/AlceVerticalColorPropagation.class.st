Class {
	#name : #AlceVerticalColorPropagation,
	#superclass : #AlceColoringStrategy,
	#category : #'Alce-Coloring'
}

{ #category : #'as yet unclassified' }
AlceVerticalColorPropagation >> colorsFor: anAlcixClass collection: aFullBlockClosure [

	colors at: anAlcixClass ifAbsent: [ 
		colors at: anAlcixClass put: OrderedCollection new.
		aFullBlockClosure value: (colors at: anAlcixClass) ]
]

{ #category : #'as yet unclassified' }
AlceVerticalColorPropagation >> selectingCategory [

	^ selectingCategory
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAccessModule: anAlcixAccessModule [

	self colorsFor: anAlcixAccessModule collection: [ :col | 
		col addAll: ((self tagsFor: anAlcixAccessModule) collect: #color) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitAlias: anAlcixAlias [

	self colorsFor: anAlcixAlias collection: [ :col | 
		col addAll: ((self tagsFor: anAlcixAlias) collect: #color).
		col addAll: (self colorsFor: anAlcixAlias container).
		col addAll: (self colorsFor: anAlcixAlias type) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitArgument: anAlcixArgument [ 
	self shouldBeImplemented.
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
		col addAll: ((self tagsFor: anAlcixClass) collect: #color).
		col addAll: (self colorsFor: anAlcixClass container) ]
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
		col addAll: ((self tagsFor: anAlcixFunction) collect: #color).
		col addAll: (self colorsFor: anAlcixFunction userType) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitLibrary: anAlcixLibrary [

	self
		colorsFor: anAlcixLibrary
		collection: [ :col | 
		col addAll: ((self tagsFor: anAlcixLibrary) collect: #color) ]
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
AlceVerticalColorPropagation >> visitPrimitiveType: anAlcixPrimitiveType [

	self visitType: anAlcixPrimitiveType
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitReport: anAlcixReport [

	^ self visitForm: anAlcixReport
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitSubProcedure: anAlcixSubProcedure [

	^ self visitFunction: anAlcixSubProcedure
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitType: anAlcixPrimitiveType [

	self colorsFor: anAlcixPrimitiveType collection: [ :col | 
		col addAll: ((self tagsFor: anAlcixPrimitiveType) collect: #color).
		col addAll: (self colorsFor: anAlcixPrimitiveType container) ]
]

{ #category : #visiting }
AlceVerticalColorPropagation >> visitTyped: anAlcixLocalVariable [ 
	self shouldBeImplemented.
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
