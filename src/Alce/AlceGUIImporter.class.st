Class {
	#name : #AlceGUIImporter,
	#superclass : #JinGUIFirstCitizenVisitor,
	#category : #'Alce-Importer'
}

{ #category : #'entry-point' }
AlceGUIImporter >> visitForm: anObject [
	| frm |
	frm := self instantiate: AlcixForm.
	frm name: anObject name.
	frm anchor: self state top anchor / #forms / anObject name.
	self state top addType: frm.
	self state push: frm.
	super visitForm: anObject.
	anObject ensureUnload.
	self state pop
]

{ #category : #'entry-point' }
AlceGUIImporter >> visitReport: anObject [
	| rpt |
	rpt := self instantiate: AlcixReport.
	rpt name: anObject name.
	rpt anchor: self state top anchor / #reports / anObject name.
	self state top addType: rpt.
	self state push: rpt.
	super visitReport: anObject.
	anObject ensureUnload.
	self state pop
]
