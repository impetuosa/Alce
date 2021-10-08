Class {
	#name : #AlcixModule,
	#superclass : #AlcixContainer,
	#instVars : [
		'#astCannotLoad => FMProperty',
		'#ast => FMProperty',
		'#globalVariables => FMMany type: #AlcixGlobalVariable opposite: #module',
		'#stringContent => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixModule class >> annotation [

	<FMClass: #Module super: #AlcixContainer>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixModule >> accept: aVisitor [
	^ aVisitor visitModule: self

]

{ #category : #adding }
AlcixModule >> addGlobalVariable: anObject [
	<generated>
	^ self globalVariables add: anObject
]

{ #category : #accessing }
AlcixModule >> ast [

	<FMProperty: #ast type: #Object>
	<generated>
	self astCannotLoad ifTrue: [ ^ ast ].

	^ ast ifNil: [ ast := self obtainAst ]
]

{ #category : #accessing }
AlcixModule >> ast: anObject [
	<generated>
	ast := anObject
]

{ #category : #accessing }
AlcixModule >> astCannotLoad [

	<FMProperty: #astCannotLoad type: #Boolean>
	<generated>
	^ astCannotLoad ifNil: [ false ]
]

{ #category : #accessing }
AlcixModule >> astCannotLoad: anObject [
	<generated>
	astCannotLoad := anObject
]

{ #category : #accessing }
AlcixModule >> globalVariables [
	"Relation named: #globalVariables type: #AlcixGlobalVariable opposite: #module"

	<generated>
	<derived>
	^ globalVariables
]

{ #category : #accessing }
AlcixModule >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject
]

{ #category : #navigation }
AlcixModule >> globalVariablesGroup [
	<generated>
	<navigation: 'GlobalVariables'>
	^ MooseSpecializedGroup withAll: self globalVariables asSet
]

{ #category : #testing }
AlcixModule >> isAstLoaded [

	^ self astCannotLoad not
]

{ #category : #accessing }
AlcixModule >> obtainAst [

	| semaphore result process |
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           result := (self class environment at: #VBParser) parse:
		                     self stringContent ]
		           on: Error
		           do: [ :e | result := e ].
	           semaphore signal ] forkAt:
		           Processor userBackgroundPriority.
	^ semaphore
		  wait: 30 seconds
		  onCompletion: [ 
			  process terminate.
			  result isError ifTrue: [ ^ result signal ].
			  result ]
		  onTimeout: [ 
			  process terminate.
			  TimedOut new signal: 'TO' ]
]

{ #category : #accessing }
AlcixModule >> strcontent [

	^ stringContent
]

{ #category : #'as yet unclassified' }
AlcixModule >> stringContent [

	<FMProperty: #stringContent type: #String>
	<generated>
	^ stringContent ifNil: [ 
		  self anchor ifNotNil: [ 
			  stringContent := (mooseModel anchorSolver
				                    readEntity: self anchor
				                    andCollect: [ :e | 
					                    stringContent := e code.
					                    stringContent isString
						                    ifTrue: [ stringContent ]
						                    ifFalse: [ stringContent content ] ]) 
				                   ifNil: [ '' ] ] ]
]

{ #category : #'as yet unclassified' }
AlcixModule >> stringContent: aContent [

	stringContent := aContent
]
