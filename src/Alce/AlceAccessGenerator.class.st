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
		'userType',
		'methodInvocation',
		'variable',
		'accessible',
		'accessRead',
		'accessWrite',
		'referenceName',
		'referenceTypeName',
		'referenceVariableName',
		'referenceInvocableName',
		'alias',
		'structure'
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
	access := builder newClassNamed: #Access.
	accessRead := builder newClassNamed: #AccessRead.
	accessWrite := builder newClassNamed: #AccessWrite.
	accessible := builder newClassNamed: #Accessible.
	accessEntity := builder newClassNamed: #AccessEntity.
	accessModule := builder newClassNamed: #AccessModule.
	alias := builder newClassNamed: 'Alias'. 
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
	
	referenceName := builder newClassNamed: #ReferenceName.
	referenceTypeName := builder newClassNamed: #TypeReference.
	referenceVariableName := builder newClassNamed: #VariableReference.
	referenceInvocableName := builder newClassNamed: #InvocableReference.
		
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	event := builder newClassNamed: #Event.
	field := builder newClassNamed: #Field.
	form := builder newClassNamed: #Form.
	globalVariable := builder newClassNamed: #GlobalVariable.
	guiClass := builder newClassNamed: #GUIClass.
	invocation := builder newClassNamed: #Invocation.
	methodInvocation := builder newClassNamed: #MethodInvocation.
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
	structure := builder newClassNamed: #Structure.
	externalSubProcedure := builder newClassNamed: #ExternalSubProcedure.
	table := builder newClassNamed: #Table.
	typedEntity := builder newClassNamed: #TypedEntity.
	query := builder newClassNamed: #Query.
	userType := builder newClassNamed: #UserType.
	variable := builder newClassNamed: #Variable
	

]

{ #category : #definition }
AlceAccessGenerator >> defineHierarchy [

	super defineHierarchy.
	access --|> accessible.
	accessRead --|> access.
	accessWrite --|> access.

	accessible --|> accessEntity.
	accessModule --|> reference.

	alias --|> typed.
	alias --|> type.
	alias  --|> accessEntity.
	
	attribute --|> variable.
	argument --|> codeSegment.
	invocable --|> accessEntity.
	class --|> module.
	codeSegment --|> accessEntity.
	userType --|> type.
	userType --|> accessible.
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
	globalVariable --|> variable.
	guiClass --|> class.
	invocation --|> accessible.
	methodInvocation --|> invocation.
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
	report --|> guiClass.

	referenceName --|> accessEntity.
	referenceTypeName --|> referenceName.
	referenceVariableName --|> referenceName.
	referenceInvocableName --|> referenceName.
	structure --|> userType.

	subProcedure --|> invocable.
	typedEntity --|> accessible.
	typedEntity --|> typed.
	externalSubProcedure --|> subProcedure.
	table --|> datasource.
	query --|> datasource.
	variable --|> typedEntity
]

{ #category : #definition }
AlceAccessGenerator >> defineProperties [

	access property: #isWriting type: #Boolean.
	access property: #isReturn type: #Boolean.
	accessWrite property: #isNewObject type: #Boolean.
	referenceName property: #names type: #Object.
	referenceName property: #isProcessedElement type: #Boolean.

	accessEntity property: #anchor type: #Object.
	argument property: #value type: #Object.

	containerType property: #name type: #String.

	enumValue property: #name type: #String.
	enumValue property: #Value type: #Object.

	attribute property: #isConstant type: #Boolean.
	attribute property: #visibility type: #String.
	attributeAccessor property: #kind type: #String.

	typedEntity property: #name type: #String.

	reference property: #name type: #String.
	reference property: #path type: #String.

	type property: #name type: #String.

	library property: #isBuiltIn type: #Boolean.
	invocable property: #selector type: #String.

	methodInvocation property: #receiver type: #Object.

	parameter property: #isOptional type: #Boolean.

	variable property: #instantiatesObjectOnDefinition type: #Boolean.

	function property: #typeAnchor type: #Object.
	externalFunction property: #alias type: #String.
	externalFunction property: #libraryName type: #String.

	invocable property: #visibility type: #String.
	localVariable property: #isConstant type: #Boolean.
	variable property: #redim type: #Boolean
]

{ #category : #definition }
AlceAccessGenerator >> defineRelations [
	(access property: #rightElement)
		*- (accessible property: #readingAccesses).
	(accessWrite property: #leftElement)
		*- (accessible property: #writingAccesses).
	(accessModule property: #references) <>-* reference.
	invocable <>-* parameter.
	invocable <>-* access.
	invocable <>-* localVariable.
	
	containerType <>-* type.
	databaseTypedEntity - databaseType.
	datasource <>-* field.
	enum <>-* enumValue.
	(invocable property: #outgoingInvocations)
		<>-* (invocation property: #sender).
	(invocable property: #incomingInvocations)
		<>-* (invocation property: #candidate).
	invocation <>-* argument.
	(userType property: #members) <>-* attribute.
	userType <>-* invocable.
	
	module <>-* globalVariable.
	attribute <>-* attributeAccessor.
	query <>-* table.
	
	(access property: #rightElementName) - referenceVariableName.
	(accessWrite property: #leftElementName) - referenceVariableName.
	(invocation property: #selector) - referenceInvocableName.
	(typed property: #typeName) - referenceTypeName.
	
		
	
	typed *- type
]

{ #category : #definition }
AlceAccessGenerator >> defineTraits [
	super defineClasses.
	type := builder newTraitNamed: #TType.
	typed := builder newTraitNamed: #TTyped.
]
