Extension { #name : #MooseAbstractGroup }

{ #category : #'*Alce' }
MooseAbstractGroup >> findTagNamed: aTagMooseName [

	"we dont care about tag category"

	^ self detect: [ :anEntity | 
		  anEntity mooseName = aTagMooseName and: [ 
			  anEntity isKindOf: FamixTag ] ]
]
