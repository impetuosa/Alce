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
	^ aModel isKindOf: AlcixModule   
]

{ #category : #initialization }
MiAlceSourceCodeBrowser >> followAction [

	viewport text: (AlceTextComposer new compose: toSelect ast model: toSelect style: self vbaStyle)
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
