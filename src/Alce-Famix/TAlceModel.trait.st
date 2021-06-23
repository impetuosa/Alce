Trait {
	#name : #TAlceModel,
	#category : #'Alce-Famix-Model'
}

{ #category : #'as yet unclassified' }
TAlceModel >> accept: aVisitor [
	^ aVisitor visitModel: self
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
TAlceModel >> firstClassCitizen [
	^ self modules , self classes , self forms , self reports
		, self tables , self queries, self classAliases
]

{ #category : #'instance creation' }
TAlceModel >> forms [
	^ self select: [ :m | m class = AlcixForm ]
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
