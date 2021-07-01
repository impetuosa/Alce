Class {
	#name : #MiAlceSourceCodeBrowser,
	#superclass : #MiAlceAbstractBrowser,
	#instVars : [
		'viewport'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #specs }
MiAlceSourceCodeBrowser class >> defaultSpec [
	^ super defaultSpec
		add: #viewport;
		yourself
]

{ #category : #specs }
MiAlceSourceCodeBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	
	<miBrowsers>
	(aBuilder item: #alceSourceBrowser)
		parent: #Moose;
		label: (self title);
		icon: (self iconNamed: #mooseTree);
		help: (self helpMessage);
		action: [ self runMe ]
]

{ #category : #specs }
MiAlceSourceCodeBrowser class >> runMe [
	<script>
	super runMe
]

{ #category : #specs }
MiAlceSourceCodeBrowser class >> title [

	^ 'Alce Source Browser'
]

{ #category : #visiting }
MiAlceSourceCodeBrowser >> accept: aModel [

	^ (aModel isKindOf: AlcixModule) or: (aModel isKindOf: AlceAnchor)
]

{ #category : #initialization }
MiAlceSourceCodeBrowser >> followAction [

	(toSelect isKindOf: AlcixModule) ifTrue: [ 
		viewport text: (AlceTextComposer new
				 compose: toSelect ast
				 model: toSelect
				 style: self vbaStyle
				 browsingWith: self) ].

	(toSelect isKindOf: AlceAnchor) ifTrue: [ 
		toSelect containsSource ifTrue: [ 
			viewport editor selectFrom: toSelect srcFrom to: toSelect srcTo ] ]
]

{ #category : #initialization }
MiAlceSourceCodeBrowser >> initializePresenters [

	super initializePresenters.
	viewport := self newText
]

{ #category : #initialization }
MiAlceSourceCodeBrowser >> vbaStyle [
	 ^ AlceVBAStyle new
]
