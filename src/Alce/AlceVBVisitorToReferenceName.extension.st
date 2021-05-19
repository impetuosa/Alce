Extension { #name : #AlceVBVisitorToReferenceName }

{ #category : #'*Alce' }
AlceVBVisitorToReferenceName >> visitSmaccToken: aSmaCCCaseInsensitiveToken [
	^ {aSmaCCCaseInsensitiveToken value asSymbol}
]
