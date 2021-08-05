Extension { #name : #JinNSSymbolTable }

{ #category : #'*Alce' }
JinNSSymbolTable >> namespaceFor: anAlceAnchor [

	| project elementsNamed space |
	

	project := assembly detect: [ :a | 
		           a name asLowercase
		           = anAlceAnchor elementProject asLowercase ].
	
	
	space := anAlceAnchor elementsNameKindPairs inject: {project} into: [ : ns : pair | 
		ns ifEmpty: [ self error: 'Namespace not found' ].
		ns first namespaceFor: pair first kind: pair second .
	] .

"

	

	elementsNamed := project entries
		                 at: anAlceAnchor elementName
		                 ifAbsent: [ self error: 'Element not found' ].
	ns := elementsNamed select: [ :e | 
		      e kind = anAlceAnchor elementNSKind ].
	
	self assert: ns size = 1.
	
	
	anAlceAnchor path size = 9 ifTrue: [ 
		ns := ns flatCollect: [ :n | 
			      n entries
				      at: anAlceAnchor secondElementName
				      ifAbsent: [ {  } ] ] ]."
	
	^ space first 
]
