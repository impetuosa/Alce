Class {
	#name : #AlceTextModelComposer,
	#superclass : #AlceTextComposer,
	#category : #'Alce-MidasBrowsers'
}

{ #category : #adding }
AlceTextModelComposer >> addAttributeTypePaint: aColor from: aFrom to: anInteger [

	aFrom > text size ifTrue: [ ^ self ].
	text
		addAttribute: (TextBackgroundColor color: aColor)
		from: aFrom
		to: (anInteger min: text size)
]

{ #category : #'as yet unclassified' }
AlceTextModelComposer >> compose: aVBModuleNode model: anAlcixClass style: anAlceVBAStyle into: aCollection [ 
	 text := aCollection.
	ast := aVBModuleNode.
	model := anAlcixClass.
	style := anAlceVBAStyle.
	anAlcixClass accept: self. 
]

{ #category : #'as yet unclassified' }
AlceTextModelComposer >> paintWithType: anAlcixAttribute [

	(anAlcixAttribute anchor isNotNil and: [ 
		 anAlcixAttribute anchor containsSource ]) ifFalse: [ ^ self ].
	self
		addAttributeTypePaint: anAlcixAttribute color
		from: anAlcixAttribute anchor srcFrom
		to: anAlcixAttribute anchor srcTo
]

{ #category : #visiting }
AlceTextModelComposer >> visitAccessRead: anAlcixAccessRead [ 
	self paintWithType: anAlcixAccessRead 
]

{ #category : #visiting }
AlceTextModelComposer >> visitAccessWrite: anAlcixAccessWrite [

	| leftTo rightFrom gap |
	anAlcixAccessWrite anchor containsSource ifFalse: [ ^ self ].
	gap := ((anAlcixAccessWrite anchor srcFrom to:
	         anAlcixAccessWrite anchor srcTo) collect: [ :i | text at: i ]) 
		       indexOf: $=.
	leftTo := anAlcixAccessWrite anchor srcFrom + gap.
	rightFrom := leftTo + 1.

	self
		addAttributeTypePaint: (anAlcixAccessWrite leftElement
				 ifNotNil: [ :n | n color ]
				 ifNil: [ anAlcixAccessWrite color ])
		from: anAlcixAccessWrite anchor srcFrom
		to: leftTo.
	self
		addAttributeTypePaint: (anAlcixAccessWrite rightElement
				 ifNotNil: [ :n | n color ]
				 ifNil: [ anAlcixAccessWrite color ])
		from: rightFrom
		to: anAlcixAccessWrite anchor srcTo
]

{ #category : #visiting }
AlceTextModelComposer >> visitAttribute: anAlcixAttribute [
	self paintWithType: anAlcixAttribute.
	
]

{ #category : #visiting }
AlceTextModelComposer >> visitClass: anAlcixClass [ 
	self visitModule: anAlcixClass.
]

{ #category : #visiting }
AlceTextModelComposer >> visitCollection: aCollection [

	aCollection do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceTextModelComposer >> visitEnum: anAlcixEnum [ 
	
]

{ #category : #visiting }
AlceTextModelComposer >> visitForm: anAlcixForm [

	self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceTextModelComposer >> visitFunction: anAlcixFunction [

	self visitSubProcedure: anAlcixFunction.
	anAlcixFunction type ifNotNil: [ 
		(anAlcixFunction typeAnchor isNotNil and: [ 
			 anAlcixFunction typeAnchor containsSource ]) ifFalse: [ ^ self ].
		self
			addAttributeTypePaint: anAlcixFunction type color
			from: anAlcixFunction typeAnchor srcFrom
			to: anAlcixFunction typeAnchor srcTo ].
]

{ #category : #visiting }
AlceTextModelComposer >> visitInvocation: anAlcixInvocation [

	self paintWithType: anAlcixInvocation
]

{ #category : #visiting }
AlceTextModelComposer >> visitMethodInvocation: anAlcixMethodInvocation [

	self paintWithType: anAlcixMethodInvocation
]

{ #category : #visiting }
AlceTextModelComposer >> visitModule: anAlcixClass [

	self visitCollection: anAlcixClass members.
	self visitCollection: anAlcixClass invocables.
	self visitCollection: anAlcixClass types
]

{ #category : #visiting }
AlceTextModelComposer >> visitParameter: anAlcixParameter [

	self paintWithType: anAlcixParameter
]

{ #category : #visiting }
AlceTextModelComposer >> visitReport: anAlcixReport [

	^ self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceTextModelComposer >> visitSubProcedure: anAlcixSubProcedure [


	self visitCollection: anAlcixSubProcedure parameters.
	self visitCollection: anAlcixSubProcedure accesses.
	self visitCollection: anAlcixSubProcedure outgoingInvocations.
	self visitCollection: anAlcixSubProcedure incomingInvocations
]

{ #category : #visiting }
AlceTextModelComposer >> visitUserType: anAlcixUserType [

	self visitCollection: anAlcixUserType members
]
