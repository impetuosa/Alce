Class {
	#name : #MiAlceModelBrowser,
	#superclass : #MiAlceAbstractBrowser,
	#instVars : [
		'table',
		'properties'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #specs }
MiAlceModelBrowser class >> defaultSpec [

	^ super defaultSpec add: (SpBoxLayout newHorizontal
			   add: #table;
			   add: #properties;
			   yourself)
]

{ #category : #specs }
MiAlceModelBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: #alceModelBrowser)
		parent: #Moose;
		label: (self title);
		icon: (self iconNamed: #mooseTree);
		help: (self helpMessage);
		action: [ self runMe ]
]

{ #category : #specs }
MiAlceModelBrowser class >> runMe [
	<script>
	super runMe
]

{ #category : #accessing }
MiAlceModelBrowser class >> title [

	^ 'Alce Model Browser'
]

{ #category : #actions }
MiAlceModelBrowser >> accept: aModel [ 
	^ aModel isKindOf: AlcixModel
]

{ #category : #actions }
MiAlceModelBrowser >> followAction [
	table items: toSelect references. 
]

{ #category : #initialization }
MiAlceModelBrowser >> initializePresenters [

	super initializePresenters.
	properties := self newTable
		              contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		              addColumn: (SpStringTableColumn new
				               title: 'Name';
				               evaluated: [ :each | each key ];
				               sortFunction: #printString ascending;
				               beExpandable;
				               yourself);
		              addColumn: (SpStringTableColumn new
				               title: 'Value';
				               evaluated: [ :each | each value ];
				               sortFunction: #printString ascending;
				               beExpandable;
				               yourself);
		              yourself.
	table := self newTable
		         contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		         whenSelectionChangedDo: [ :e | 
			         self selection: e.
			         self updateProperties ];
		         whenActivatedDo: [ :entry | self updateSelectedItem ];
		         addColumn: (SpIndexTableColumn new
				          title: 'Index';
				          sortFunction: #yourself ascending;
				          beNotExpandable;
				          width: 20;
				          yourself);
		         addColumn: ((SpImageTableColumn evaluated: [ :each | 
					           MiAlceIdeIcons iconFor: each ])
				          width: 10;
				          sortFunction: #className ascending;
				          yourself);
		         addColumn: (SpStringTableColumn new
				          title: 'Name';
				          evaluated: [ :each | each name ];
				          sortFunction: #printString ascending;
				          beExpandable;
				          yourself);
		         yourself
]

{ #category : #initialization }
MiAlceModelBrowser >> updateProperties [

	self miSelectedItem ifNil: [ ^ self ].
	properties items: { 
			(#Kind -> self miSelectedItem class entryName).
			(#Path -> self miSelectedItem path).
			(#'#Types' -> self miSelectedItem types size asString).
			(#'#Globals' -> self miSelectedItem members size asString).
			(#'#Color' -> self miSelectedItem color) }
]

{ #category : #initialization }
MiAlceModelBrowser >> updateSelectedItem [

	self updateProperties. 
	self propagate
]
