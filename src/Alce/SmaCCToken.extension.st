Extension { #name : #SmaCCToken }

{ #category : #'*Alce' }
SmaCCToken >> acceptVisitor: anAlceVBVisitorToString [ 
	^ anAlceVBVisitorToString visitSmaccToken: self 
]
