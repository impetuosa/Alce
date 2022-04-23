Extension { #name : #MiAbstractBrowser }

{ #category : #'*Alce' }
MiAbstractBrowser >> propagate [

	(MiPropagateCommand forSpecContext: self) execute
]
