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
		'raiseEvent',
		'reference',
		'report',
		'subProcedure',
		'externalSubProcedure',
		'table',
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
		'containerType',
		'attributeAccessor',
		'typed',
		'type',
		'userType'
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
	attributeAccessor := builder newClassNamed: #AttributeAccessor.
	argument := builder newClassNamed: #Argument.
	invocable := builder newClassNamed: #Invocable.
	class := builder newClassNamed: #Class.
	codeSegment := builder newClassNamed: #CodeSegment.
	containerType := builder newClassNamed: #Container.
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
	raiseEvent := builder newClassNamed: #RaiseEvent.
	reference := builder newClassNamed: #Reference.
	report := builder newClassNamed: #Report.
	subProcedure := builder newClassNamed: #SubProcedure.
	externalSubProcedure := builder newClassNamed: #ExternalSubProcedure.
	table := builder newClassNamed: #Table.
	typedEntity := builder newClassNamed: #TypedEntity.
	query := builder newClassNamed: #Query.
	userType := builder newClassNamed: #UserType.
	



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
	userType --|> type.
	userType --|> accessEntity.
	containerType --|> userType.
	databaseType --|> type.
	databaseType --|> accessEntity.
	databaseTypedEntity --|> typedEntity.
	datasource --|> containerType.
	enum --|> type.
	enum --|> accessEntity.
	enumValue --|> accessEntity.
	event --|> invocable.
	field --|> typedEntity.
	form --|> guiClass.
	function --|> invocable.
	function --|> typed.
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
	primitiveType --|> accessEntity.
	attributeAccessor --|> invocable.
	raiseEvent --|> invocation.
	reference --|> containerType.
	report --|> guiClass.
	subProcedure --|> invocable.
	typedEntity --|> accessEntity.
	typedEntity --|> typed.
	externalSubProcedure --|> subProcedure.
	table --|> datasource.
	query --|> datasource
]

{ #category : #definition }
AlceAccessGenerator >> defineProperties [
	access property: #isWriting type: #Boolean.
	access property: #attributeName type: #String.
	accessEntity property: #anchor type: #Object.
	containerType property: #name type: #String.
	enumValue property: #name type: #String.
	enumValue property: #Value type: #Object.
	attribute property: #isConstant type: #Boolean.
	attributeAccessor property: #kind type: #String.
	typedEntity property: #name type: #String.
	reference property: #name type: #String.
	reference property: #path type: #String.
	type property: #name type: #String.
	typed property: #typeName type: #String.
	library property: #isBuiltIn type: #Boolean.
	invocable property: #selector type: #String
]

{ #category : #definition }
AlceAccessGenerator >> defineRelations [
	access *- attribute.
	(accessModule property: #references) <>-* reference.
	argument *- parameter.
	invocable <>-* parameter.
	invocable <>-* access.
	invocable <>-* localVariable.
	(userType property: #members) <>-* typedEntity.
	containerType <>-* type.
	databaseTypedEntity - databaseType.
	datasource <>-* field.
	enum <>-* enumValue.
	invocation <>- invocable.
	module <>-* invocable.
	module <>-* globalVariable.
	attribute <>-* attributeAccessor.
	query <>-* table.
	typed <>- type
]

{ #category : #definition }
AlceAccessGenerator >> defineTraits [
	super defineClasses.
	type := builder newTraitNamed: #TType.
	typed := builder newTraitNamed: #TTyped.
]
