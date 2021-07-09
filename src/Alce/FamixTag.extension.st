Extension { #name : #FamixTag }

{ #category : #'*Alce' }
FamixTag class >> tagFor: aColor model: anAlcixModel [

	^ anAlcixModel allTags detect: [ :a | a color = aColor ] ifNone: [ 
		  (anAlcixModel instantiate: self)
			  name: #coloring;
			  color: aColor;
			  yourself ]
]
