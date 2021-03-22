Class {
	#name : #AlcixAttributeAccessor,
	#superclass : #AlcixInvocable,
	#instVars : [
		'#kind => FMProperty',
		'#attribute => FMOne type: #AlcixAttribute opposite: #attributeAccessors'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAttributeAccessor class >> annotation [

	<FMClass: #AttributeAccessor super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
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
