"
A linker does link calls with definitionsm by the applciation of a lookup method for name resolution
"
Class {
	#name : #AlceLinker,
	#superclass : #AlceVisitor,
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLinker class >> link: anAlcixModel [ 
	| linker | 
	linker := self new.
	anAlcixModel accept: linker .
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupFunctionOrSub: aMatch in: aNode [
	^ AlceLookUp lookFor: AlceLookForFunctionOrSubIn matching: aMatch from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupMethod: aMatch in: aNode [
	^ AlceLookUp lookFor: AlceLookForMethodsIn matching: aMatch from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupType: aMatch in: aNode [
	^ AlceLookUp lookFor: AlceLookForTypesIn matching: aMatch from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupVariable: aMatch in: aNode [
	^ AlceLookUp lookFor: AlceLookForVariablesIn matching: aMatch from: aNode
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitAccess: anAlcixAccess [
	anAlcixAccess attribute
		ifNil: [ (self
				lookupVariable: anAlcixAccess attributeName
				in: anAlcixAccess invocable)
				ifNotNil: [ :a | anAlcixAccess attribute: a ] ]
]

{ #category : #visiting }
AlceLinker >> visitAttribute: anAttribute [ 
	self visitTypedEntity: anAttribute 
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitClass: anAlcixClass [

]

{ #category : #'as yet unclassified' }
AlceLinker >> visitEnum: anAlcixEnum [
	anAlcixEnum enumValues do: [  : e | e accept: self  ] 
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitEnumValue: anAlcixEnumValue [
	
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitForm: anAlcixForm [
	self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceLinker >> visitFunction: aFunction [
	aFunction type
		ifNil: [ aFunction type: (self lookupType: aFunction typeName in: aFunction module) ].
	self visitInvocable: aFunction
]

{ #category : #visiting }
AlceLinker >> visitInvocable: anInvocable [
	anInvocable parameters do: [ :p | p accept: self ].
	anInvocable outgoingInvocations do: [ :i | i accept: self ].
	anInvocable accesses do: [ :a | a accept: self ]
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitInvocation: anAlcixInvocation [
	anAlcixInvocation candidate
		ifNil: [ (self
				lookupFunctionOrSub: anAlcixInvocation selector
				in: anAlcixInvocation sender)
				ifNotNil: [ :c | anAlcixInvocation candidate: c ] ]
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitMethodInvocation: anAlcixMethodInvocation [
	anAlcixMethodInvocation receiver invocable  ifNil: [  anAlcixMethodInvocation receiver invocable: anAlcixMethodInvocation sender ].
	anAlcixMethodInvocation receiver accept: self.
	"anAlcixMethodInvocation receiver attribute accept: self. "
	anAlcixMethodInvocation receiver attribute
		ifNotNil: [ :attr | 
			attr type
				ifNotNil: [ :type | 
					anAlcixMethodInvocation
						candidate:
							(self
								lookupMethod: anAlcixMethodInvocation receiver memberSelectors first
								in: type) ] ]
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

{ #category : #'as yet unclassified' }
AlceLinker >> visitParameter: anAlcixParameter [
	anAlcixParameter type
		ifNil: [ (self
				lookupType: anAlcixParameter typeName
				in: anAlcixParameter invocable)
				ifNotNil: [ :t | anAlcixParameter type: t ] ]
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitReport: anAlcixReport [
	self visitForm: anAlcixReport
]

{ #category : #visiting }
AlceLinker >> visitSubProcedure: aSub [
	self visitInvocable: aSub
]

{ #category : #visiting }
AlceLinker >> visitTypedEntity: aTyped [
	aTyped type
		ifNil: [ aTyped type: (self lookupType: aTyped typeName in: aTyped userType) ]
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitUserType: anAlcixUserType [
	anAlcixUserType members do: [ :m | m accept: self ]
]
