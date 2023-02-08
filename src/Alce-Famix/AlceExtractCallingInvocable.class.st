Class {
	#name : #AlceExtractCallingInvocable,
	#superclass : #Object,
	#category : #'Alce-Famix-Uncategorized'
}

{ #category : #'as yet unclassified' }
AlceExtractCallingInvocable >> extract: anAlcixInvocation [ 
	 ^ anAlcixInvocation accept: self 
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitAccess: anAlcixAccess [

	^ anAlcixAccess withAccesses accept: self
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitArgument: anAlcixArgument [

	^ anAlcixArgument activation ifNotNil: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitAssignment: anAlcixAssignment [

	^ anAlcixAssignment owner
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitFunction: anAlcixFunction [

	^ anAlcixFunction
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitInvocation: anAlcixInvocation [

	^ anAlcixInvocation withAccesses accept: self
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitReturn: anAlcixReturn [

	^ anAlcixReturn invocable acceptVisitor: self
]

{ #category : #visiting }
AlceExtractCallingInvocable >> visitSubProcedure: anAlcixSubProcedure [

	^ anAlcixSubProcedure
]
