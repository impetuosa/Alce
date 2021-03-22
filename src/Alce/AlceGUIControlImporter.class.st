Class {
	#name : #AlceGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'entry-point' }
AlceGUIControlImporter >> visitFormControl: anObject [
	| attribute |
	attribute := self instantiate: AlcixAttribute.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	self state top addTypedEntity: attribute
]
