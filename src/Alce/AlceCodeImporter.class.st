Class {
	#name : #AlceCodeImporter,
	#superclass : #JinCodeFirstCitizenVisitor,
	#category : #'Alce-Importer'
}

{ #category : #'visit-first-objects' }
AlceCodeImporter >> avoidingEntities [

	^{} 
	"|^ { 'CBeanOEC'. 'CBeanDeclarants'. 'FactLieuCelebMariageUsuelFiche'.
	  'Form_FactLieuCelebMariageUsuelFiche'.
	  'FactLieuDecesUsuelFiche'. 'Form_FactLieuDecesUsuelFiche'.
	  'FactLieuTribunalFiche'. 'Form_FactLieuTribunalFiche'.
	  'FactLieuAccouchementUsuelFiche'. 'Form_FactLieuAccouchementUsuelFiche'.
	  'CMVCFicheControler'. 'CMetrologyModel'. 'CPieceJointeModel'.
	  'FNavigateurWeb'. 'Form_CMVCFicheControler'.
	  'Form_CMetrologyModel'. 'Form_CPieceJointeModel'.
	  'Form_FNavigateurWeb' . 'FGedMetadataSF' . 'Form_FGedMetadataSF' .
		'Form_FgpeCollectiviteFiche' . 'FgpeCollectiviteFiche' .
		'Form_CPanelEvenement' . 'CPanelEvenement' . 
				'Form_CPanelIdentite' . 'CPanelIdentite' . 
		'Form_CBeanMention' . 'CBeanMention' .
		'CBeanCommission' . 'Form_CBeanCommission' . 'CDemESV'
	 }|"
]

{ #category : #'visit-first-objects' }
AlceCodeImporter >> visitFormModule: anObject [

	" EGRC BUGS!! :( "

	(self avoidingEntities includes: anObject name) ifTrue: [ .
		self halt.
		^ self state top astCannotLoad:true  ].
	" ): EGRC BUGS!!  "

	super visitModule: anObject
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

	(self avoidingEntities includes: anObject name) ifTrue: [ 
				self halt.
		^ obj astCannotLoad: true  ].
	" ): EGRC BUGS!!  "


	self state push: obj.


	super visitModule: anObject.
	anObject ensureUnload.
	self state pop
]
