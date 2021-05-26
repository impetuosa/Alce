"
A linker does link calls with definitionsm by the applciation of a lookup method for name resolution
"
Class {
	#name : #AlceLinker,
	#superclass : #AlceVisitor,
	#instVars : [
		'changed',
		'maxTries',
		'tries'
	],
	#category : #'Alce-Importer-Linker'
}

{ #category : #'as yet unclassified' }
AlceLinker class >> link: anAlcixModel [ 
	| linker | 
	linker := self new.
	linker link: anAlcixModel .
	^ linker.
]

{ #category : #'as yet unclassified' }
AlceLinker class >> maxTries [ 	
	^ 10.
]

{ #category : #changes }
AlceLinker >> beginIteration [
	changed := false. 
	tries := tries + 1. 
]

{ #category : #initialization }
AlceLinker >> initialize [
	super initialize.
	changed := false.
	maxTries := self class maxTries.
	tries := 0.
]

{ #category : #changes }
AlceLinker >> isFinished [
	^ tries >= maxTries or: [ changed not ]
]

{ #category : #changes }
AlceLinker >> link: aModel [
	" 
		The linking process is iterative. 
		Some elements cannot be linked before types, or function return type, etc. 
	"
	[ 
	self beginIteration.
	aModel accept: self ] doWhileFalse: [ self isFinished ].
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupFunctionOrSub: aMatch in: aNode [

	^ AlceLookUp
		  lookFor: AlceLookForFunctionOrSubIn
		  matching: aMatch
		  from: aNode
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

{ #category : #changes }
AlceLinker >> noteChange [
	changed := true.
]

{ #category : #visiting }
AlceLinker >> visitAccess: anAlcixAccess [
	anAlcixAccess rightElement
		ifNil: [ (self
				lookupVariable: anAlcixAccess rightElementName
				in: anAlcixAccess invocable)
				ifNotNil: [ :a | 
					anAlcixAccess rightElement: a.
					self noteChange ] ]
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitAccessRead: anAlcixAccessRead [
	self visitAccess: anAlcixAccessRead
]

{ #category : #'as yet unclassified' }
AlceLinker >> visitAccessWrite: anAlcixAccessWrite [
	self visitAccess: anAlcixAccessWrite.
	anAlcixAccessWrite leftElement
		ifNil: [ (self
				lookupVariable: anAlcixAccessWrite leftElementName
				in: anAlcixAccessWrite invocable)
				ifNotNil: [ :a | 
					anAlcixAccessWrite leftElement: a.
					self noteChange ] ]
]

{ #category : #visiting }
AlceLinker >> visitAttribute: anAttribute [ 
	self visitTypedEntity: anAttribute 
]

{ #category : #visiting }
AlceLinker >> visitClass: anAlcixClass [
	self visitModule: anAlcixClass 
	
]

{ #category : #visiting }
AlceLinker >> visitEnum: anAlcixEnum [

]

{ #category : #visiting }
AlceLinker >> visitEnumValue: anAlcixEnumValue [
	
]

{ #category : #visiting }
AlceLinker >> visitForm: anAlcixForm [
	self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceLinker >> visitFunction: aFunction [

	aFunction type ifNil: [ 
		(self lookupType: aFunction typeName in: aFunction userType) 
			ifNotNil: [ :t | 
				self noteChange.
				aFunction type: t ] ].
	self visitInvocable: aFunction
]

{ #category : #visiting }
AlceLinker >> visitInvocable: anInvocable [
	anInvocable parameters do: [ :p | p accept: self ].
	anInvocable outgoingInvocations do: [ :i | i accept: self ].
	anInvocable accesses do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceLinker >> visitInvocation: anAlcixInvocation [

	anAlcixInvocation candidate ifNil: [ 
		(self
			 lookupFunctionOrSub: anAlcixInvocation selector
			 in: anAlcixInvocation sender) ifNotNil: [ :c | 
			self noteChange.
			anAlcixInvocation setCandidate: c ] ]
]

{ #category : #visiting }
AlceLinker >> visitMethodInvocation: anAlcixMethodInvocation [

	anAlcixMethodInvocation receiver invocable ifNil: [ 
		anAlcixMethodInvocation receiver invocable:
			anAlcixMethodInvocation sender ].
	anAlcixMethodInvocation receiver accept: self.
	"anAlcixMethodInvocation receiver attribute accept: self. "
	anAlcixMethodInvocation candidate ifNil: [ 
		anAlcixMethodInvocation receiver rightElement ifNotNil: [ :attr | 
			attr type ifNotNil: [ :type | 
				self noteChange.
				anAlcixMethodInvocation setCandidate:
					(self
						 lookupMethod: anAlcixMethodInvocation selector 
						 in: type) ] ] ]
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
AlceLinker >> visitParameter: anAlcixParameter [

	anAlcixParameter type ifNil: [ 
		(self
			 lookupType: anAlcixParameter typeName
			 in: anAlcixParameter invocable) ifNotNil: [ :t | 
			self noteChange.
			anAlcixParameter type: t ] ]
]

{ #category : #visiting }
AlceLinker >> visitReport: anAlcixReport [
	self visitForm: anAlcixReport
]

{ #category : #visiting }
AlceLinker >> visitSubProcedure: aSub [
	self visitInvocable: aSub
]

{ #category : #visiting }
AlceLinker >> visitTypedEntity: aTyped [

	aTyped type ifNil: [ 
		(self lookupType: aTyped typeName in: aTyped userType) ifNotNil: [ 
			:t | 
			aTyped type: t.
			self noteChange ] ]
]

{ #category : #visiting }
AlceLinker >> visitUserType: anAlcixUserType [
	anAlcixUserType members do: [ :m | m accept: self ]
]
