Class {
	#name : #MiAlceReferenceBrowser,
	#superclass : #MiAlceAbstractBrowser,
	#instVars : [
		'viewport',
		'tables'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #specs }
MiAlceReferenceBrowser class >> defaultSpec [
	^ super defaultSpec
		add: #viewport;
		yourself
]

{ #category : #specs }
MiAlceReferenceBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: #alceReferenceBrowser)
		parent: #Moose;
		label: (self title);
		icon: (self iconNamed: #mooseTree);
		help: (self helpMessage);
		action: [ self runMe ]
]

{ #category : #specs }
MiAlceReferenceBrowser class >> runMe [
	<script>
	super runMe
]

{ #category : #accessing }
MiAlceReferenceBrowser class >> title [

	^ 'Alce Reference Browser'
]

{ #category : #actions }
MiAlceReferenceBrowser >> accept: aModel [ 
	^ aModel isKindOf: AlcixReference  
]

{ #category : #actions }
MiAlceReferenceBrowser >> cleanup [ 
	viewport removeAll.
	tables valuesDo: [ : v |  v  items: {  } ]
]

{ #category : #actions }
MiAlceReferenceBrowser >> followAction [
	self cleanup.
	((toSelect types , toSelect members) asSet groupedBy: #class) 
		associationsDo: [ :group | 
			(self tableNamed: group key entryName) items:
				group value asOrderedCollection ].
	viewport selectPage: viewport pages first
]

{ #category : #initialization }
MiAlceReferenceBrowser >> initializePresenters [

	super initializePresenters.
	viewport := self newNotebook .
	tables := Dictionary new
]

{ #category : #actions }
MiAlceReferenceBrowser >> tableNamed: aTableName [

	| table |
	table := tables at: aTableName ifAbsentPut: [ 
		         | instance |
		         instance := self newTable
			                     whenSelectionChangedDo: [ :sel | self selection: sel ];
			                     addColumn: (SpIndexTableColumn new
					                      title: 'Index';
					                      sortFunction: #yourself ascending;
					                      beNotExpandable;
					                      width: 20;
					                      yourself);
			                     addColumn:
				                     ((SpImageTableColumn evaluated: [ :each | 
						                       MiAlceIdeIcons iconFor: each ])
					                      width: 10;
					                      sortFunction: #className ascending;
					                      yourself);
			                     addColumn: (SpStringTableColumn new
					                      title: 'Name';
					                      evaluated: [ :each | each name ];
					                      sortFunction: #printString ascending;
					                      beExpandable;
					                      yourself) ].

	viewport addPage: ((SpNotebookPage
			  title: aTableName
			  icon: (self iconNamed: #nautilusIcon)
			  provider: table)
			 beCloseable;
			 yourself).

	^ table
]
