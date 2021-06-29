Class {
	#name : #MiAlceTypeBrowser,
	#superclass : #MiAlceAbstractBrowser,
	#instVars : [
		'typesTable',
		'membersTable',
		'invocableTable',
		'parametersTable'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #specs }
MiAlceTypeBrowser class >> defaultSpec [

	^ super defaultSpec
		  add: #membersTable;
		  add: (SpBoxLayout newHorizontal
				   add: #invocableTable;
				   add: #parametersTable;
				   yourself);
		  add: #typesTable;
		  yourself
]

{ #category : #specs }
MiAlceTypeBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: #alceTypeBrowser)
		parent: #Moose; 
		label: (self title);
		icon: (self iconNamed: #mooseTree);
		help: (self helpMessage);
		action: [ self runMe ]
]

{ #category : #specs }
MiAlceTypeBrowser class >> runMe [
	<script>
	super runMe
]

{ #category : #specs }
MiAlceTypeBrowser class >> title [

	^ 'Alce Type Browser'
]

{ #category : #visiting }
MiAlceTypeBrowser >> accept: aModel [

	^ { 
		  AlcixEnum.
		  AlcixUserType } anySatisfy: [ :a | aModel isKindOf: a ]
]

{ #category : #visiting }
MiAlceTypeBrowser >> followAction [
	typesTable items: toSelect types asSet asOrderedCollection.
	invocableTable items: toSelect invocables asSet asOrderedCollection.
	membersTable items: toSelect members asSet asOrderedCollection.
	parametersTable items: {  }
]

{ #category : #visiting }
MiAlceTypeBrowser >> initializePresenters [

	super initializePresenters.
	typesTable := self newTypesTable. 
	invocableTable := self newInvocablesTable.
	parametersTable := self newMembersTable.
	membersTable := self newMembersTable. 
]

{ #category : #visiting }
MiAlceTypeBrowser >> newInvocablesTable [

	"Smalltalk ui icons"

	^ self newTable
		  contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		  whenSelectionChangedDo: [ :e | 
			  self selection: e.
			  self selectParameters ];
		  addColumn: (SpIndexTableColumn new
				   title: 'Index';
				   sortFunction: #yourself ascending;
				   beNotExpandable;
				   width: 20;
				   yourself);
		  addColumn: ((SpImageTableColumn new
				    title: 'Resolved';
				    evaluated: [ :each | 
					    (each isKindOf: AlcixFunction)
						    ifFalse: [ self iconNamed: #uncommentedClass ]
						    ifTrue: [ 
							    each type
								    ifNil: [ self iconNamed: #smallQuestion ]
								    ifNotNil: [ self iconNamed: #glamorousAccept ] ] ])
				   width: 10;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Type';
				   evaluated: [ :each | 
					   (each isKindOf: AlcixFunction)
						   ifFalse: [ 'void' ]
						   ifTrue: [ 
							   each typeName
								   ifNil: [ 'Unknown' ]
								   ifNotNil: [ :ref | ref adaptToAlceAnchorPathFragment ] ] ];
				   sortFunction: #printString ascending;
				   beExpandable;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Selector';
				   evaluated: [ :each | each selector ];
				   sortFunction: #printString ascending;
				   beExpandable;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: '#Parameters';
				   evaluated: [ :each | each parameters size ];
				   beExpandable;
				   yourself);
		  addColumn: ((SpImageTableColumn evaluated: [ :each | 
					    (Morph new color: each color) asForm ])
				   width: 10;
				   yourself);
		  yourself
]

{ #category : #visiting }
MiAlceTypeBrowser >> newMembersTable [

	"Smalltalk ui icons"

	^ self newTable
		  contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		  whenSelectionChangedDo: [ :e | self selection: e ];
		  whenActivatedDo: [ :entry | 
			  self selection: entry.
			  self propagate ];
		  addColumn: (SpIndexTableColumn new
				   title: 'Index';
				   sortFunction: #yourself ascending;
				   beNotExpandable;
				   width: 20;
				   yourself);
		  addColumn: ((SpImageTableColumn new
				    title: 'Resolved';
				    evaluated: [ :each | 
					    each type
						    ifNil: [ self iconNamed: #smallQuestion ]
						    ifNotNil: [ self iconNamed: #glamorousAccept ] ])
				   width: 10;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Type';
				   evaluated: [ :each | each typeName ];
				   sortFunction: #printString ascending;
				   beExpandable;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: [ :each | each name ];
				   sortFunction: #printString ascending;
				   beExpandable;
				   yourself);
		  addColumn: ((SpImageTableColumn evaluated: [ :each | 
					    (Morph new color: each color) asForm ])
				   width: 10;
				   yourself);
		  yourself
]

{ #category : #visiting }
MiAlceTypeBrowser >> newTypesTable [

	^ self newTable
		  contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		  whenSelectionChangedDo: [ :e | self selection: e ];
		  whenActivatedDo: [ :entry | 
			  self selection: entry.
			  self propagate ];
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
		  addColumn: ((SpImageTableColumn evaluated: [ :each | 
					    (Morph new color: each color) asForm ])
				   width: 10;
				   yourself) yourself
]

{ #category : #visiting }
MiAlceTypeBrowser >> selectParameters [

	selection ifNotNil: [ 
		parametersTable items: selection parameters asOrderedCollection ]
]
