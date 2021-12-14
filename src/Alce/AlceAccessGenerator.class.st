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
		'form',
		'globalVariable',
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
		'datasource',
		'accessModule',
		'argument',
		'accessEntity',
		'typedEntity',
		'library',
		'containerType',
		'attributeAccessor',
		'typed',
		'type',
		'userType',
		'variable',
		'accessible',
		'accessRead',
		'alias',
		'expression',
		'withAccesses',
		'assignment',
		'unknownElement',
		'undefinedElement',
		'accessProject',
		'literal',
		'constant',
		'tableField',
		'withConstants',
		'return'
	],
	#category : #'Alce-Generator'
}

{ #category : #accessing }
AlceAccessGenerator class >> generate [
	super generate.
	AlcixEntity allSubclasses
		do: [ :c | 
			c
				compile:
					('accept: aVisitor
	^ aVisitor visit{1}: self
' format: {(c name copyReplaceAll: 'Alcix' with: '')})
				classified: 'visiting' ].
			
	AlcixEntity allSubclasses
		do: [ :c | 
			c
				compile:
					('acceptLanguageVisitor: aVisitor
	^ aVisitor visitMicrosoftAccess{1}: self
' format: {(c name copyReplaceAll: 'Alcix' with: '')})
				classified: 'visiting' ]
]

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

	literal := builder newClassNamed: #Literal.
	tableField := builder newClassNamed: #TableField.
	access := builder newClassNamed: #Access.
	accessRead := builder newClassNamed: #AccessRead.
	assignment := builder newClassNamed: #Assignment.

	constant := builder newClassNamed: #Constant.

	withAccesses := builder newClassNamed: #WithAccesses.

	accessible := builder newClassNamed: #Accessible.
	accessEntity := builder newClassNamed: #AccessEntity.
	accessModule := builder newClassNamed: #AccessModule.
	accessProject := builder newClassNamed: #AccessProject.


	alias := builder newClassNamed: #Alias.
	attribute := builder newClassNamed: #Attribute.
	attributeAccessor := builder newClassNamed: #AttributeAccessor.
	argument := builder newClassNamed: #Argument.

	invocable := builder newClassNamed: #Invocable.
	class := builder newClassNamed: #Class.
	containerType := builder newClassNamed: #Container.
	databaseType := builder newClassNamed: #DatabaseType.

	datasource := builder newClassNamed: #DataSource.
	expression := builder newClassNamed: #Expression.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	event := builder newClassNamed: #Event.

	form := builder newClassNamed: #Form.
	globalVariable := builder newClassNamed: #GlobalVariable.
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
	
	
	return := builder newClassNamed: #Return. 
	table := builder newClassNamed: #Table.
	typedEntity := builder newClassNamed: #TypedEntity.
	query := builder newClassNamed: #Query.
	userType := builder newClassNamed: #UserType.
	variable := builder newClassNamed: #Variable.
	unknownElement := builder newClassNamed: #UnknownElement.
	undefinedElement := builder newClassNamed: #UndefinedElement
	

]

{ #category : #definition }
AlceAccessGenerator >> defineHierarchy [

	super defineHierarchy.
	access --|> accessible.
	literal --|> accessible. 
	undefinedElement --|> accessible.
	undefinedElement --|> type.
	unknownElement --|> undefinedElement.


	accessRead --|> access.
	assignment --|> withAccesses.
	
	accessProject --|> accessEntity. 
	
	accessible --|> accessEntity.
	accessModule --|> reference.
	withAccesses --|> accessible.

	argument --|> withAccesses.
	invocable --|> withAccesses.
	invocable --|> withConstants. 

	expression --|> withAccesses.


	return --|> withAccesses. 
		

	alias --|> typed.
	alias --|> type.
	alias --|> accessible.
	
	attribute --|> variable.
	tableField --|> attribute. 
	
	class --|> module.
	userType --|> type.
	userType --|> accessible.
	userType --|> withConstants. 
	containerType --|> userType.
	databaseType --|> primitiveType.

	datasource --|> class.
	enum --|> type.
	enum --|> accessible.
	enumValue --|> accessible.
	event --|> invocable.

	form --|> class.
	function --|> invocable.
	function --|> typed.
	globalVariable --|> variable.
	invocation --|> access.

	localVariable --|> variable.
	externalFunction --|> function.
	macro --|> invocable.
	module --|> containerType.
	library --|> reference.
	parameter --|> typedEntity.
	primitiveType --|> type.
	primitiveType --|> accessible.
	attributeAccessor --|> function.
	raiseEvent --|> invocation.
	reference --|> containerType.
	report --|> class.


	subProcedure --|> invocable.
	typedEntity --|> accessible.
	typedEntity --|> typed.
	externalSubProcedure --|> subProcedure.
	table --|> datasource.
	query --|> datasource.
	variable --|> typedEntity.
	
	constant --|> typed.
	constant --|> withAccesses. 

]

{ #category : #definition }
AlceAccessGenerator >> defineProperties [

	literal property: #value type: #Object.
	literal property: #kind type: #String.

	tableField property: #size type: #Number.
	assignment withTesting.
	assignment property: #isReturn type: #Boolean.
	assignment property: #isNewObject type: #Boolean.
	
	
	assignment property: #readElements type: #Object.
	assignment property: #writeElement type: #Object.
	
	accessible property: #visibility type: #String.
	
	
	accessEntity property: #anchor type: #Object.
	argument property: #value type: #Object.

	containerType property: #name type: #String.

	enumValue property: #name type: #String.
	enumValue property: #value type: #Object.

	attributeAccessor property: #kind type: #String.

	typedEntity property: #name type: #String.

	reference property: #name type: #String.
	reference property: #path type: #String.

	type property: #name type: #String.

	library property: #isBuiltIn type: #Boolean.
	invocable property: #selector type: #String.

	parameter property: #isOptional type: #Boolean.

	variable property: #instantiatesObjectOnDefinition type: #Boolean.

	function property: #typeAnchor type: #Object.
	externalFunction property: #alias type: #String.
	externalFunction property: #libraryName type: #String.
	externalSubProcedure property: #alias type: #String.
	externalSubProcedure property: #libraryName type: #String.
	
	constant property: #value type: #Object.
	constant property: #name type: #String.

	variable property: #redim type: #Boolean.
	module property: #astCannotLoad type: #Boolean.
	module property: #ast type: #Object
]

{ #category : #definition }
AlceAccessGenerator >> defineRelations [

	(access property: #candidates)
	*-* (accessible property: #incomingAccesses).
	(access property: #arguments) <>-* (argument property: #activation).


	(accessProject property: #modules)
	<>-* (accessModule property: #project).
	(accessModule property: #references) <>-* reference.

	(withAccesses property: #outgoingAccesses) <>-* access.
	(withAccesses property: #assignments)
	<>-* (assignment property: #owner).

	invocable <>-* parameter.
	invocable <>-* localVariable.
	invocable <>-* return. 

	(withConstants property: #constants) <>-* (constant property: #owner).

	containerType <>-* type.

	(userType property: #members) <>-* attribute.
	userType <>-* invocable.

	(class property: #superclass) *-<> (class property: #subclass).

	module <>-* globalVariable.
	attribute <>-* attributeAccessor.
	query <>-* table.

	enum <>-* enumValue.
	typed *- type
]

{ #category : #definition }
AlceAccessGenerator >> defineTraits [
	super defineTraits.
	type := builder newTraitNamed: #TType.
	typed := builder newTraitNamed: #TTyped.
	withConstants := builder newTraitNamed: #TWithConstants. 
]
