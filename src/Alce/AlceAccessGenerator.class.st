Class {
	#name : #AlceAccessGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'access',
		'attribute',
		'class',
		'enum',
		'enumValue',
		'event',
		'field',
		'form',
		'globalVariable',
		'implicitVariable',
		'invocation',
		'localVariable',
		'function',
		'externalFunction',
		'macro',
		'module',
		'parameter',
		'primitiveType',
		'property',
		'raiseEvent',
		'reference',
		'report',
		'subProcedure',
		'externalSubProcedure',
		'table',
		'type',
		'query',
		'invocable',
		'databaseType',
		'guiClass',
		'datasource',
		'accessModule',
		'argument',
		'accessEntity',
		'typedEntity',
		'databaseTypedEntity',
		'codeSegment',
		'library',
		'containerSimple',
		'containerType',
		'propertyAccessor'
	],
	#category : #'Alce-Generator'
}

{ #category : #accessing }
AlceAccessGenerator class >> packageName [
	^ 'Alce-Famix'
]

{ #category : #accessing }
AlceAccessGenerator class >> prefix [

	^ #Alcix
]

{ #category : #definition }
AlceAccessGenerator >> defineClasses [
	
	super defineClasses.
	
	access := builder newClassNamed: #Access.
	accessEntity := builder newClassNamed: #AccessEntity. 
	accessModule := builder newClassNamed: #AccessModule.
	attribute := builder newClassNamed: #Attribute.
	argument := builder newClassNamed: #Argument.
	invocable := builder newClassNamed: #Invocable.
	class := builder newClassNamed: #Class.
	codeSegment := builder newClassNamed: #CodeSegment.
	containerType := builder newClassNamed: #ContainerType.
	containerSimple := builder newClassNamed: #Container.
	databaseType := builder newClassNamed: #DatabaseType.
	databaseTypedEntity := builder newClassNamed: #DatabaseTypedEntity.
	datasource := builder newClassNamed: #DataSource.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	event := builder newClassNamed: #Event.
	field := builder newClassNamed: #Field.
	form := builder newClassNamed: #Form.
	globalVariable := builder newClassNamed: #GlobalVariable.
	guiClass := builder newClassNamed: #GUIClass.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	function := builder newClassNamed: #Function.
	externalFunction := builder newClassNamed: #ExternalFunction.
	macro := builder newClassNamed: #Macro.
	module := builder newClassNamed: #Module.
	library := builder newClassNamed: #Library.
	parameter := builder newClassNamed: #Parameter.
	primitiveType := builder newClassNamed: #PrimitiveType.
	property := builder newClassNamed: #Property.
	propertyAccessor := builder newClassNamed: #PropertyAccessor.
	raiseEvent := builder newClassNamed: #RaiseEvent.
	reference := builder newClassNamed: #Reference.
	report := builder newClassNamed: #Report.
	subProcedure := builder newClassNamed: #SubProcedure.
	externalSubProcedure := builder newClassNamed: #ExternalSubProcedure.
	table := builder newClassNamed: #Table.
	typedEntity := builder newClassNamed: #TypedEntity.
	query := builder newClassNamed: #Query.
	

]

{ #category : #definition }
AlceAccessGenerator >> defineHierarchy [
	super defineHierarchy.
	access --|> accessEntity.
	accessModule --|> reference.
	attribute --|> typedEntity.
	argument --|> codeSegment.
	invocable --|> accessEntity.
	class --|> module.
	codeSegment --|> accessEntity.
	containerType --|> type.
	containerType --|> accessEntity.
	containerSimple --|> accessEntity.
	databaseType --|> type.
	databaseTypedEntity --|> typedEntity.
	datasource --|> containerType.
	enum --|> type.
	enumValue --|> accessEntity.
	event --|> invocable.
	field --|> typedEntity.
	form --|> guiClass.
	function --|> invocable.	"Also typed"
	globalVariable --|> typedEntity.
	guiClass --|> class.
	implicitVariable --|> typedEntity.
	invocation --|> accessEntity.
	localVariable --|> typedEntity.
	externalFunction --|> function.
	macro --|> invocable.
	module --|> containerType.
	library --|> reference.
	parameter --|> typedEntity.
	primitiveType --|> type.
	property --|> typedEntity.
	propertyAccessor --|> invocable.
	raiseEvent --|> invocation.
	reference --|> containerSimple.
	report --|> guiClass.
	subProcedure --|> invocable.
	externalSubProcedure --|> subProcedure.
	table --|> datasource.
	query --|> datasource
]

{ #category : #definition }
AlceAccessGenerator >> defineProperties [
	access property: #isWriting type: #Boolean.
	accessEntity property: #anchor type: #Object.
	containerType property: #name type: #String.
	enumValue property: #name type: #String.
	enumValue property: #Value type: #Object.
	propertyAccessor property: #kind type: #String.
	typedEntity property: #name type: #String.
	reference property: #name type: #String.
	reference property: #path type: #String.
	library property: #isBuiltIn type: #Boolean
]

{ #category : #definition }
AlceAccessGenerator >> defineRelations [
	access *- attribute.
	(accessModule property: #references) <>-* reference.
	argument *- parameter.
	invocable <>-* parameter.
	invocable <>-* access.
	containerSimple <>-* accessEntity.
	containerType <>-* typedEntity.
	databaseTypedEntity - databaseType.
	datasource <>-* field.
	enum <>-* enumValue.
	invocation <>- invocable.
	function <>- type.
	module <>-* invocable.
	property <>-* propertyAccessor .
	(property property: #attribute) - attribute.
	query <>-* table.
	typedEntity <>- type.
]

{ #category : #definition }
AlceAccessGenerator >> defineTraits [
	super defineClasses.
	type := builder newTraitNamed: #TType
]
