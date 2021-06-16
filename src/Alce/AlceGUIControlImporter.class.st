Class {
	#name : #AlceGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#traits : 'AlceTypeConversions',
	#classTraits : 'AlceTypeConversions classTrait',
	#category : #'Alce-Importer'
}

{ #category : #'entry-point' }
AlceGUIControlImporter >> visitFormControl: anObject [
	| attribute |
	attribute := self instantiate: AlcixAttribute.
	attribute visibility: #Public.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	attribute typeName: (self typeName: anObject mappedTypeName).
	self state top addMember: attribute
]
