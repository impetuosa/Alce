Class {
	#name : #AlceSDKLibraryBuilder,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'as yet unclassified' }
AlceSDKLibraryBuilder class >> forModel: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : #building }
AlceSDKLibraryBuilder >> build [

	| library |
	library := self instantiate: AlcixLibrary.
	self types do: [ :t | library addType: t ]
]

{ #category : #building }
AlceSDKLibraryBuilder >> instantiate: aClass [
 	^ model instantiate: aClass
]
