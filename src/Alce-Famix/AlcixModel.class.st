Class {
	#name : #AlcixModel,
	#superclass : #MooseModel,
	#traits : 'TAlceModel',
	#classTraits : 'TAlceModel classTrait',
	#instVars : [
		'selectedColoringStrategy',
		'metrics',
		'fylgja',
		'anchor'
	],
	#category : #'Alce-Famix'
}

{ #category : #accessing }
AlcixModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #( #'Alce-Famix' )
]

{ #category : #meta }
AlcixModel class >> annotation [
	<FMClass: #AlcixModel super: #MooseModel>
	<package: #'Alce-Famix'>
	<generated>
]

{ #category : #accessing }
AlcixModel class >> entryName [
	^ #Model
]

{ #category : #accessing }
AlcixModel >> anchor [

	^ anchor ifNil: [ anchor := JinAnchor on: #/ ]
]

{ #category : #'as yet unclassified' }
AlcixModel >> derivative [

	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #'instance creation' }
AlcixModel >> instantiate: aClass [

	| element |
	element := aClass new.
	self add: element.
	^ element
]

{ #category : #'accessing - structure variables' }
AlcixModel >> metrics [

	^ metrics ifNil: [ 
		  metrics := MTRAlceMetricsExtractor metricsFor: self ]
]

{ #category : #'as yet unclassified' }
AlcixModel >> selectedColoringStrategy [
	^ selectedColoringStrategy ifNil: [ selectedColoringStrategy := coloringStrategies anyOne ]
]

{ #category : #accessing }
AlcixModel >> selectedColoringStrategy: anAlceHorizontalColorPropagation [ 
	selectedColoringStrategy := anAlceHorizontalColorPropagation
]
