Class {
	#name : #AlcixAttributeAccessor,
	#superclass : #AlcixFunction,
	#instVars : [
		'#kind => FMProperty',
		'#attribute => FMOne type: #AlcixAttribute opposite: #attributeAccessors'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAttributeAccessor class >> annotation [

	<FMClass: #AttributeAccessor super: #AlcixFunction>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAttributeAccessor >> accept: aVisitor [
	^ aVisitor visitAttributeAccessor: self

]

{ #category : #accessing }
AlcixAttributeAccessor >> attribute [
	"Relation named: #attribute type: #AlcixAttribute opposite: #attributeAccessors"

	<generated>
	<container>
	^ attribute
]

{ #category : #accessing }
AlcixAttributeAccessor >> attribute: anObject [

	<generated>
	attribute := anObject
]

{ #category : #navigation }
AlcixAttributeAccessor >> attributeGroup [
	<generated>
	<navigation: 'Attribute'>
	^ MooseSpecializedGroup with: self attribute
]

{ #category : #accessing }
AlcixAttributeAccessor >> includedColorsInto: colors [

	super includedColorsInto: colors.
	attribute ifNotNil: [ colors add: attribute color ]
]

{ #category : #accessing }
AlcixAttributeAccessor >> kind [

	<FMProperty: #kind type: #String>
	<generated>
	^ kind
]

{ #category : #accessing }
AlcixAttributeAccessor >> kind: anObject [
	<generated>
	kind := anObject
]
