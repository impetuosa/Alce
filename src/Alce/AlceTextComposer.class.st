Class {
	#name : #AlceTextComposer,
	#superclass : #Object,
	#instVars : [
		'ast',
		'textStream'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #'as yet unclassified' }
AlceTextComposer >> compose: anAst [

	ast := anAst.
	textStream := '' writeStream.
	ast acceptVisitor: self.

	^ MicroDownParser asText: textStream contents
]
