Class {
	#name : #AlceDispatchingImporter,
	#superclass : #JinSingleInstanceDispatchVisitor,
	#instVars : [
		'model',
		'filter',
		'sdkLibrary',
		'savingPhases'
	],
	#category : #'Alce-Importer'
}

{ #category : #'instance creation' }
AlceDispatchingImporter >> filter: aBlock [
	filter := aBlock
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> initialize [
	super initialize.
	state := Stack new.
	filter := [ :a | true ]
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> instantiate: aClass [
	^ model instantiate: aClass
]

{ #category : #accessing }
AlceDispatchingImporter >> model [
	^ model
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> model: aModel [
	model := aModel
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> savingPhases [

	^ savingPhases ifNil: [ false ]
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> savingPhases: aBool [ 
	savingPhases := aBool
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> sdkLibrary [
	^ sdkLibrary ifNil: [  sdkLibrary := (AlceSDKLibraryBuilder forModel: model) build ]
]

{ #category : #'instance creation' }
AlceDispatchingImporter >> visitCollection: aCollection [
	| col |
	col := filter
		ifNil: [ :f | aCollection select: [ :e | filter value: e ] ]
		ifNotNil: [ aCollection ].
	^ super visitCollection: col
]
