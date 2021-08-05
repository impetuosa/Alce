Class {
	#name : #AlceSymbolTableLookUp,
	#superclass : #AlceLook,
	#instVars : [
		'lookInClass',
		'matchingReference',
		'symbolTable'
	],
	#category : #'Alce-Linker'
}

{ #category : #'as yet unclassified' }
AlceSymbolTableLookUp >> lookFor: aClass matching: anAlcixTypeReference from: anAlcixModule [

	| ns tr ins |
	tr := anAlcixTypeReference splitInRefs.
	ns := symbolTable namespaceFor: anAlcixModule anchor.

	ns := tr allButLast inject: ns into: [ :space :ref | 
		      ins := space symbolsRespondingTo: ref names first.
		      symbolTable namespaceFor:
			      (aClass lookInto: anAlcixModule symbol: ins) findings anchor ].
	ins := ns symbolsRespondingTo: tr last names first.


	self findings: (aClass lookInto: anAlcixModule symbol: ins) findings.

	^ findings
]

{ #category : #accessing }
AlceSymbolTableLookUp >> symbolTable: aJinNSSymbolTable [ 
	symbolTable := aJinNSSymbolTable
]
