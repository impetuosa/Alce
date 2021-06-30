"
A linker does link calls with definitionsm by the applciation of a lookup method for name resolution
"
Class {
	#name : #AlceLinker,
	#superclass : #AlceVisitor,
	#instVars : [
		'changed',
		'maxTries',
		'tries',
		'promiscuous'
	],
	#category : #'Alce-Linker'
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
	promiscuous := false. 
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
	promiscuous := true.
	[ 
	self beginIteration.
	aModel accept: self ] doWhileFalse: [ self isFinished ]
]

{ #category : #'lookup flavors' }
AlceLinker >> lookVariableClass [
	^ promiscuous
		  ifTrue: [ AlceLookForPromiscuousIn ]
		  ifFalse: [ AlceLookForVariablesIn ]
	
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupForMethodClass [

	^ promiscuous
		  ifTrue: [ AlceLookForPromiscuousIn ]
		  ifFalse: [ AlceLookForMethodsIn ]
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupFunctionClass [

	^ promiscuous
		  ifTrue: [ AlceLookForPromiscuousIn ]
		  ifFalse: [ AlceLookForFunctionOrSubIn ]
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupFunctionOrSub: aMatch in: aNode [

	^ AlceLookUp
		  lookFor: self lookupFunctionClass 
		  matching: aMatch
		  from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupMethod: aMatch in: aNode [
	^ AlceLookUp lookFor: self lookupForMethodClass  matching: aMatch from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupType: aMatch in: aNode [
	^ AlceLookUp lookFor: self lookupTypeClass matching: aMatch from: aNode
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupTypeClass [

	^ promiscuous
		  ifTrue: [ AlceLookForPromiscuousIn ]
		  ifFalse: [ AlceLookForTypesIn ]
]

{ #category : #'lookup flavors' }
AlceLinker >> lookupVariable: aMatch in: aNode [
	| found |
	aMatch isEmptyOrNil
		ifTrue: [ ^ nil ].
	^ AlceLookUp
		lookFor: self lookVariableClass 
		matching: aMatch
		from: aNode.
	
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
					anAlcixAccess setRightElement: a.
					self noteChange ] ]
]

{ #category : #'\\' }
AlceLinker >> visitAccessModule: anAlcixAccessModule [ 
	" Should load the dependancies no? "
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
					anAlcixAccessWrite setLeftElement: a.
					self noteChange ] ]
]

{ #category : #visiting }
AlceLinker >> visitAlias: anAlcixAlias [
	
	anAlcixAlias type ifNil: [ 
		| type references | 
		type := (self lookupType: anAlcixAlias typeName in: anAlcixAlias userType).
		
		type ifNil: [ 
			references := (anAlcixAlias mooseModel references reject: [: r |r  =anAlcixAlias  userType ]) readStream .
			self assert: (anAlcixAlias userType isKindOf: AlcixLibrary). 
			[ type isNil and: [ references atEnd not  ] ]	whileTrue: [ 
				type := (self lookupType: anAlcixAlias typeName in: references next).	
			 ]
		 ].
		type  ifNotNil: [ 
			:t | 
			anAlcixAlias type: t.
			self noteChange ] ]
]

{ #category : #visiting }
AlceLinker >> visitAttribute: anAttribute [ 
	self visitTypedEntity: anAttribute 
]

{ #category : #visiting }
AlceLinker >> visitAttributeAccessor: anAlcixAttributeAccessor [

	^ self visitFunction: anAlcixAttributeAccessor
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
AlceLinker >> visitEvent: anAlcixEvent [

	self visitInvocable: anAlcixEvent
]

{ #category : #visiting }
AlceLinker >> visitExternalFunction: anAlcixExternalFunction [

	self visitFunction: anAlcixExternalFunction
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
	anInvocable localVariables do: [ :p | p accept: self ].
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
AlceLinker >> visitLibrary: anAlcixLibrary [ 
" something here? "
]

{ #category : #visiting }
AlceLinker >> visitLocalVariable: anAlcixLocalVariable [

	anAlcixLocalVariable type ifNil: [ 
		(self
			 lookupType: anAlcixLocalVariable typeName
			 in: anAlcixLocalVariable invocable) ifNotNil: [ :t | 
			anAlcixLocalVariable type: t.
			self noteChange ] ]
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
				| candidate |
				candidate := self
					             lookupMethod: anAlcixMethodInvocation selector
					             in: type.
				candidate ifNotNil: [ 
					self noteChange.
					anAlcixMethodInvocation setCandidate: candidate ] ] ] ]
]

{ #category : #visiting }
AlceLinker >> visitModel: aModel [

	aModel firstClassCitizen do: [ :fs | fs accept: self ].
	aModel references do: [ :fs | fs accept: self ]
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
AlceLinker >> visitRaiseEvent: anAlcixRaiseEvent [

	^ self visitInvocation: anAlcixRaiseEvent
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
