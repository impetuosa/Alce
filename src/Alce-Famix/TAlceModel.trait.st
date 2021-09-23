Trait {
	#name : #TAlceModel,
	#instVars : [
		'anchorSolver',
		'coloringStrategies'
	],
	#category : #'Alce-Famix-Traits'
}

{ #category : #'as yet unclassified' }
TAlceModel >> accept: aVisitor [
	^ aVisitor visitModel: self
]

{ #category : #'instance creation' }
TAlceModel >> anchorSolver [

	^ anchorSolver ifNil: [ 
		  anchorSolver := AlceAnchorSolver new.
		  anchorSolver model: self.
		  anchorSolver ]
]

{ #category : #'instance creation' }
TAlceModel >> classAliases [
	^ self select: [ :m | m class = AlcixAlias]
]

{ #category : #'instance creation' }
TAlceModel >> classes [
	^ self select: [ :m | m class = AlcixClass ]
]

{ #category : #'instance creation' }
TAlceModel >> coloringStrategies [

	^ coloringStrategies ifNil: [ 
		  coloringStrategies := OrderedCollection new ]
]

{ #category : #'instance creation' }
TAlceModel >> createArchitectureCategory [

	| artifacts palette |
	self allTagCategories
		detect: [ :a | a name = 'Architecture' ]
		ifFound: [ ^ self error: ' Already exists' ].

	artifacts := self createTagCategoryNamed: 'Architecture'.

	#( DataAccess UI Business Commun Communication ) do: [ :a | 
		(self createTagNamed: a) addCategory: artifacts ].
	palette := RSQualitativeColorPalette new set310 domain:
		           artifacts markedTags.

	artifacts markedTags do: [ :t | t color: (palette scale: t) ]
]

{ #category : #'instance creation' }
TAlceModel >> createArtefactCategory [

	| artifacts palette |
	self allTagCategories
		detect: [ :a | a name = 'Artefacts' ]
		ifFound: [ ^ self error: ' Already exists' ].
	artifacts := self createTagCategoryNamed: 'Artefacts'.

	self entities
		select: [ :a | a isKindOf: AlcixReference ]
		thenCollect: [ :a | 
			| tag |
			a allTags ifEmpty: [ 
				tag := self createTagNamed: a name.
				tag addCategory: artifacts.
				a tagWith: tag ] ] model allTags.
	palette := RSQualitativeColorPalette new set310 domain: self allTags.

	self allTags do: [ :a | a color: (palette scale: a) ]
]

{ #category : #'instance creation' }
TAlceModel >> firstClassCitizen [
	^ self modules , self classes , self forms , self reports
		, self tables , self queries, self classAliases
]

{ #category : #'instance creation' }
TAlceModel >> forms [
	^ self select: [ :m | m class = AlcixForm ]
]

{ #category : #'instance creation' }
TAlceModel >> installColoringStrategy: aStrategy [

	^ self coloringStrategies add: aStrategy
]

{ #category : #'instance creation' }
TAlceModel >> instantiate: aClass [
	| element |
	element := aClass new.
	self add: element.
	^ element
]

{ #category : #'instance creation' }
TAlceModel >> macros [
	^ self select: [ :m | m class = AlcixMacro ]
]

{ #category : #'instance creation' }
TAlceModel >> modules [
	^ self select: [ :m | m class = AlcixModule ]
]

{ #category : #'instance creation' }
TAlceModel >> project [

	^ self detect: [ :m | m class = AlcixAccessProject ]
]

{ #category : #'instance creation' }
TAlceModel >> queries [
	^ self select: [ :m | m class = AlcixQuery ]
]

{ #category : #'instance creation' }
TAlceModel >> references [
	^ self select: [ :m | m isKindOf: AlcixReference ]
]

{ #category : #'instance creation' }
TAlceModel >> reports [
	^ self select: [ :m | m class = AlcixReport ]
]

{ #category : #'instance creation' }
TAlceModel >> tables [
	^ self select: [ :m | m class = AlcixTable ]
]
