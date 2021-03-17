Class {
	#name : #AlcixAccessAnchorToText,
	#superclass : #AlcixAccessAnchor,
	#instVars : [
		'#codeSegment => FMOne type: #AlcixCodeSegment opposite: #accessAnchorToText'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessAnchorToText class >> annotation [

	<FMClass: #AccessAnchorToText super: #AlcixAccessAnchor>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAccessAnchorToText >> codeSegment [
	"Relation named: #codeSegment type: #AlcixCodeSegment opposite: #accessAnchorToText"

	<generated>
	^ codeSegment
]

{ #category : #accessing }
AlcixAccessAnchorToText >> codeSegment: anObject [

	<generated>
	codeSegment := anObject
]

{ #category : #navigation }
AlcixAccessAnchorToText >> codeSegmentGroup [
	<generated>
	<navigation: 'CodeSegment'>
	^ MooseSpecializedGroup with: self codeSegment
]
