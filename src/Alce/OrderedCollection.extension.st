Extension { #name : #OrderedCollection }

{ #category : #'*Alce' }
OrderedCollection >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitCollection: self
]
