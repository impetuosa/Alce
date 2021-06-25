Class {
	#name : #AlceCodeImporter,
	#superclass : #JinCodeFirstCitizenVisitor,
	#category : #'Alce-Importer'
}

{ #category : #'visit-first-objects' }
AlceCodeImporter >> registerClassVariables: anAlcixClass [ 
	
]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitFormModule: anObject [
	super visitModule: anObject.

]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitMacro: aMacro [

]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitModule: anObject [

	| obj |
	obj := anObject isClassModule
		       ifTrue: [ self instantiate: AlcixClass ]
		       ifFalse: [ self instantiate: AlcixModule ].
	self state top addType: obj.
	obj name: anObject name.
	obj anchor: self state top anchor / #modules / anObject name.
	
	
		" EGRC BUGS!! :( "

	({ 'CBeanOEC'. 'CBeanDeclarants'. 'FactLieuCelebMariageUsuelFiche'.
	 'Form_FactLieuCelebMariageUsuelFiche'.
	 'FactLieuDecesUsuelFiche'. 'Form_FactLieuDecesUsuelFiche'.
	 'FactLieuTribunalFiche'. 'Form_FactLieuTribunalFiche'.
	 'FactLieuAccouchementUsuelFiche'. 'Form_FactLieuAccouchementUsuelFiche' } 
		 includes: anObject name) ifTrue: [ ^ self state top astCannotLoad ].
	" ): EGRC BUGS!!  "

	
	self state push: obj.


	super visitModule: anObject.
	anObject ensureUnload.
	self state pop
]
