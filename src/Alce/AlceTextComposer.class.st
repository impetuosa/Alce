Class {
	#name : #AlceTextComposer,
	#superclass : #Object,
	#traits : 'TVBProgramNodeVisitor',
	#classTraits : 'TVBProgramNodeVisitor classTrait',
	#instVars : [
		'ast',
		'text',
		'model',
		'style'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #adding }
AlceTextComposer >> addAttributeAccessorKind: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style accessorKind
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeAs: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style as forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeAssignmentKind: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style assignmentKind
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeCase: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style case forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeColor: aVBToken [

	^ self addStyle: (style colorForToken: aVBToken) forToken: aVBToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeCompare: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style compare
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeConst: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style const forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeDatabase: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style database forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeDim: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style dim
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeElse: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style else forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeEndToken: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style endKeyword
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeEnum: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style enum forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeError: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style errorStyle
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeExplicit: aSmaCCCaseInsensitiveToken [ 

	^ self
		  addStyle: style explicit
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeFunction: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style functionKeyword
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeGoTo: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style goto forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeIf: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style if forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeKeyword: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style keyword forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeLabel: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style label forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeLiteral: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style literal forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeNew: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style new forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeNext: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style next forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOn: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style on
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOperator: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style operator forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOption: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style option forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeProperty: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style property forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeResume: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style resume forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #enumerating }
AlceTextComposer >> addAttributeSelect: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style select forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeStringLiteral: aSmaCCCaseInsensitiveToken [ 
^ self
		  addStyle: style string 
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeSub: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style sub forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeThen: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style then forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeType: aSmaCCCaseInsensitiveToken [ 
	
^ self
		  addStyle: style type
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeVisibility: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style visibility
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeWith: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style with forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addColor: aColor forToken: aToken [

	aToken ifNil: [ ^ self ].
	text
		addAttribute: (TextColor new color: aColor)
		from: aToken startPosition
		to: aToken stopPosition
]

{ #category : #adding }
AlceTextComposer >> addStyle: aStyleArray forToken: aToken [

	aToken ifNil: [ ^ self ].
	aStyleArray do: [ :aStyle | 
		text
			addAttribute: aStyle
			from: (aToken startPosition min: text size)
			to: (aToken stopPosition min: text size) ]
]

{ #category : #'as yet unclassified' }
AlceTextComposer >> compose: anAst model: aModel style: aStyle browsingWith: aBrowsingObject [

	anAst ifNil: [ ^ Text fromString: '' ].
	text := Text fromString: anAst source.

	AlceTextModelComposer new
		compose: anAst
		model: aModel
		style: aStyle
		into: text
		browsingWith: aBrowsingObject.

	AlceTextAstComposer new
		compose: anAst
		model: aModel
		style: aStyle
		into: text
		browsingWith: aBrowsingObject.



	^ text
]
