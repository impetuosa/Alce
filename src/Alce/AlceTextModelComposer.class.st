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
		addAttributeTypePaint: anAlcixAttribute colorOrPopularColor
		from: anAlcixAttribute anchor srcFrom
		to: anAlcixAttribute anchor srcTo
]

{ #category : #visiting }
AlceTextModelComposer >> splitting: aSideSelector colors: anAlcixAccessRead gap: gap [

	^ self
		  splitting: aSideSelector
		  colors: anAlcixAccessRead
		  gap: gap
		  from: anAlcixAccessRead anchor srcFrom
		  to: anAlcixAccessRead anchor srcTo
]

{ #category : #visiting }
AlceTextModelComposer >> splitting: aSideSelector colors: anAlcixAccessRead gap: gap from: from to: to [

	| leftTo rightFrom |
	(anAlcixAccessRead perform: aSideSelector asSymbol) ifNil: [ ^ self ].
	gap = 0 ifTrue: [ ^ self paintWithType: anAlcixAccessRead ].
	leftTo := from + gap - 1.
	rightFrom := leftTo + 1.

	self
		addAttributeTypePaint:
			((anAlcixAccessRead perform: aSideSelector asSymbol)
				 ifNotNil: [ :n | 
					 (n isKindOf: AlcixMethodInvocation)
						 ifTrue: [ n receiver colorOrPopularColor ]
						 ifFalse: [ n userType colorOrPopularColor ] ]
				 ifNil: [ anAlcixAccessRead colorOrPopularColor ])
		from: from
		to: leftTo.
	self
		addAttributeTypePaint:
			((anAlcixAccessRead perform: aSideSelector asSymbol)
				 ifNotNil: [ :n | n colorOrPopularColor ]
				 ifNil: [ anAlcixAccessRead colorOrPopularColor ])
		from: rightFrom
		to: to
]

{ #category : #visiting }
AlceTextModelComposer >> visitAccessRead: anAlcixAccessRead [

	| gap |
	anAlcixAccessRead anchor ifNil: [ ^ self ].
	anAlcixAccessRead anchor containsSource ifFalse: [ ^ self ].
	gap := ((anAlcixAccessRead anchor srcFrom to:
	         anAlcixAccessRead anchor srcTo) collect: [ :i | text at: i ]) 
		       lastIndexOf: $..

	self splitting: #rightElement colors: anAlcixAccessRead gap: gap
]

{ #category : #visiting }
AlceTextModelComposer >> visitAccessWrite: anAlcixAccessWrite [

	| gap chain |
	anAlcixAccessWrite anchor containsSource ifFalse: [ ^ self ].
	chain := '' join: ((anAlcixAccessWrite anchor srcFrom to:
		           anAlcixAccessWrite anchor srcTo) collect: [ :i | 
			          text at: i ]).
	gap := chain indexOf: $=.
	chain := '=' split: chain.

	self
		splitting: #leftElement
		colors: anAlcixAccessWrite
		gap: (chain first lastIndexOf: $.)
		from: anAlcixAccessWrite anchor srcFrom
		to: anAlcixAccessWrite anchor srcFrom + gap.
	self
		splitting: #rightElement
		colors: anAlcixAccessWrite
		gap: (chain second lastIndexOf: $.)
		from: anAlcixAccessWrite anchor srcFrom + gap + 1
		to: anAlcixAccessWrite anchor srcTo

	"	leftTo := anAlcixAccessWrite anchor srcFrom + gap.
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
		to: anAlcixAccessWrite anchor srcTo"
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
			addAttributeTypePaint: anAlcixFunction type colorOrPopularColor
			from: anAlcixFunction typeAnchor srcFrom
			to: anAlcixFunction typeAnchor srcTo ].
]

{ #category : #visiting }
AlceTextModelComposer >> visitInvocation: anAlcixInvocation [

	anAlcixInvocation anchor ifNil: [ ^ self ].
	self
		addAttributeTypePaint: anAlcixInvocation colorOrPopularColor
		from: anAlcixInvocation anchor srcFrom
		to: anAlcixInvocation anchor srcFrom
			+ anAlcixInvocation selector adaptToAlceAnchorPathFragment size
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
