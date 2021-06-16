Class {
	#name : #AlceGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#category : #'Alce-Importer'
}

{ #category : #'entry-point' }
AlceGUIControlImporter >> visitFormControl: anObject [
	| attribute |
	
	attribute := self instantiate: AlcixAttribute.
	attribute visibility: #Private.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	self state top addMember: attribute
]
