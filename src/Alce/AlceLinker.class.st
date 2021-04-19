Class {
	#name : #AlceLinker,
	#superclass : #AlceVisitor,
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLinker class >> link: anAlcixModel [ 
	| linker | 
	linker := self new.
	anAlcixModel accept: self .
]

{ #category : #visiting }
AlceLinker >> lookup: aMatch in: aNode [
	^ AlceLookup lookFor: aMatch from: aNode
]

{ #category : #visiting }
AlceLinker >> visitAttribute: anAttribute [ 
	self visitTypedEntity: anAttribute 
]

{ #category : #visiting }
AlceLinker >> visitFunction: aFunction [
	self visitTypedEntity: aFunction.
	self visitInvocable: aFunction
]

{ #category : #visiting }
AlceLinker >> visitInvocable: anInvocable [
	anInvocable parameters do: [ :p | p accept: self ].
	anInvocable outgoingInvocations do: [ :i | i accept: self ].
	anInvocable accesses do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceLinker >> visitModel: aModel [
	aModel firstClassCitizen do: [ :fs | fs accept: self ]
]

{ #category : #visiting }
AlceLinker >> visitModule: aModule [
	aModule types do: [ :m | m accept: self ].
	aModule members do: [ :m | m accept: self ].
	aModule invocables do: [ :m | m accept: self ]
]

{ #category : #visiting }
AlceLinker >> visitSubProcedure: aSub [
	self visitInvocable: aSub
]

{ #category : #visiting }
AlceLinker >> visitTypedEntity: aTyped [
	aTyped type
		ifNil: [ aTyped type: (self lookup: aTyped typeName in: aTyped) ]
]
