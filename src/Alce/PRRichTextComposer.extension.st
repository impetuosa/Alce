Extension { #name : #PRRichTextComposer }

{ #category : #'*Alce' }
PRRichTextComposer >> visitColorFormat: aPRColorFormat [

	canvas
		includeAttributes: aPRColorFormat attributes
		in: [ self visitFormat: aPRColorFormat ]
]
