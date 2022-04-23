Extension { #name : #MicRichTextComposer }

{ #category : #'*Alce' }
MicRichTextComposer >> visitColorFormat: aPRColorFormat [

	canvas
		includeAttributes: aPRColorFormat attributes
		in: [ self visitFormat: aPRColorFormat ]
]
