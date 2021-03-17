Class {
	#name : #AlcixCodeSegment,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#from => FMProperty',
		'#to => FMProperty',
		'#accessAnchorToText => FMOne type: #AlcixAccessAnchorToText opposite: #codeSegment'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixCodeSegment class >> annotation [

	<FMClass: #CodeSegment super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixCodeSegment >> accessAnchorToText [
	"Relation named: #accessAnchorToText type: #AlcixAccessAnchorToText opposite: #codeSegment"

	<generated>
	<container>
	<derived>
	^ accessAnchorToText
]

{ #category : #accessing }
AlcixCodeSegment >> accessAnchorToText: anObject [

	<generated>
	accessAnchorToText := anObject
]

{ #category : #navigation }
AlcixCodeSegment >> accessAnchorToTextGroup [
	<generated>
	<navigation: 'AccessAnchorToText'>
	^ MooseSpecializedGroup with: self accessAnchorToText
]

{ #category : #accessing }
AlcixCodeSegment >> from [

	<FMProperty: #from type: #Number>
	<generated>
	^ from
]

{ #category : #accessing }
AlcixCodeSegment >> from: anObject [
	<generated>
	from := anObject
]

{ #category : #accessing }
AlcixCodeSegment >> to [

	<FMProperty: #to type: #Number>
	<generated>
	^ to
]

{ #category : #accessing }
AlcixCodeSegment >> to: anObject [
	<generated>
	to := anObject
]
