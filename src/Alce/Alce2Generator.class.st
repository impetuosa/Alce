Class {
	#name : #Alce2Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'access',
		'attribute',
		'class',
		'containerEntity',
		'enum',
		'enumValue',
		'globalVariable',
		'implicitVariable',
		'inheritance',
		'invocation',
		'localVariable',
		'parameter',
		'parameterType',
		'primitiveType',
		'type',
		'unknownVariable',
		'module',
		'form',
		'report',
		'table',
		'query',
		'datasource',
		'function',
		'subprocedure',
		'event',
		'onError',
		'accessModule',
		'accessAnchor',
		'project',
		'accessor',
		'constant',
		'library',
		'typeAlias',
		'struct',
		'argument',
		'reference',
		'accessWrite',
		'withArguments',
		'literal',
		'undefinedType',
		'dbType',
		'unknownType'
	],
	#category : #'Alce-Generator'
}

{ #category : #accessing }
Alce2Generator class >> generate [
	super generate.
	AlceIXEntity allSubclasses
		do: [ :c | 
			c
				compile:
					('accept: aVisitor
	^ aVisitor visit{1}: self
' format: {(c name copyReplaceAll: 'AlceIX' with: '')})
				classified: 'visiting' ]
]

{ #category : #accessing }
Alce2Generator class >> packageName [

	^ #'AlcIX-Access-Entities'
]

{ #category : #accessing }
Alce2Generator class >> prefix [

	^ #'AlceIX'
]

{ #category : #definition }
Alce2Generator >> defineClasses [
	super defineClasses.
	
	access := builder newClassNamed: #Access.
	accessWrite := builder newClassNamed: #AccessWrite.

	literal := builder newClassNamed: #Literal. 
	
	reference := builder newClassNamed: #Reference.  
	
	argument := builder newClassNamed: #Argument. 
	
	typeAlias  := builder newClassNamed: #TypeAlias.
	attribute := builder newClassNamed: #Attribute.
	constant := builder newClassNamed: #Constant.
	onError := builder newClassNamed: #OnError.
	
	project := builder newClassNamed: #AccessProject.
	
	accessModule := builder newClassNamed: #AccessModule.
	library := builder newClassNamed: #Library.
	
	class := builder newClassNamed: #Class.
	module := builder newClassNamed: #Module.
	form := builder newClassNamed: #Form.
	report := builder newClassNamed: #Report.
	table := builder newClassNamed: #Table.
	query := builder newClassNamed: #Query.
	datasource := builder newClassNamed: #DataSource.
	
	struct := builder newClassNamed: #Struct. 
	
	containerEntity := builder newClassNamed: #ContainerEntity.

	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.

	globalVariable := builder newClassNamed: #GlobalVariable.
	implicitVariable := builder newClassNamed: #ImplicitVariable.

	accessAnchor := builder newClassNamed: #AccessAnchor.

	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	
	accessor := builder newClassNamed: #Accessor. 
	function := builder newClassNamed: #Function.
	subprocedure := builder newClassNamed: #SubProcedure.
	event := builder newClassNamed: #Event.
	
	parameter := builder newClassNamed: #Parameter.
	parameterType := builder newClassNamed: #ParameterType.

	primitiveType := builder newClassNamed: #PrimitiveType.
	dbType := builder newClassNamed: #DBType.

	type := builder newClassNamed: #Type.
	undefinedType := builder newClassNamed: #UndefinedType. 
	unknownType := builder newClassNamed: #UnknownType. 
	
	unknownVariable := builder newClassNamed: #UnknownVariable.

	primitiveType withTesting.

]

{ #category : #definition }
Alce2Generator >> defineHierarchy [

	access --|> #TAccess.
	access --|> withArguments. 
	access --|> #TNamedEntity. 
	accessWrite --|> #TAccess. 
	
	
	reference --|> access. 
	reference --|> #TAccessible.
	reference --|> #TNamedEntity.
	
	
	attribute --|> namedEntity.
	attribute --|> #TAttribute.
	attribute --|> #THasVisibility.
	attribute --|> #TInvocationsReceiver.

	constant --|> namedEntity.
	constant --|> #TAttribute.
	constant --|> #THasVisibility.
	constant --|> #TInvocationsReceiver.

	accessAnchor --|> sourceAnchor.
	accessAnchor --|> #TIndexedFileNavigation.

	function --|> containerEntity.
	function --|> #TMethod.
	function --|> #THasVisibility.
	function --|> #THasKind.

	accessor --|> containerEntity.
	accessor --|> #TMethod.
	accessor --|> #THasKind.
	accessor --|> #THasVisibility.

	subprocedure --|> containerEntity.
	subprocedure --|> #TMethod.
	subprocedure --|> #THasKind.
	subprocedure --|> #THasVisibility.

	event --|> containerEntity.
	event --|> #TMethod.
	event --|> #THasKind.

	accessModule --|> containerEntity.
	accessModule --|> #TAccessible. 
	accessModule --|> #TWithGlobalVariables.
	accessModule --|> #TPackage.
	accessModule --|> #TPackageable.

	library --|> accessModule.
	library --|> #TWithAttributes.

	module --|> type.
	module --|> #TClass.
	module --|> #TLCOMMetrics.
	module --|> #THasVisibility.
	module --|> #TClassMetrics.
	module --|> #TWithComments.

	struct --|> type.
	struct --|> #TWithAttributes .
	struct --|> #THasVisibility.
	
	
	class --|> type.
	class --|> #TClass.
	class --|> #TLCOMMetrics.
	class --|> #THasVisibility.
	class --|> #TClassMetrics.
	class --|> #TWithComments.

	form --|> class.
	report --|> class.
	datasource --|> class.
	table --|> datasource.
	query --|> datasource.

	containerEntity --|> namedEntity.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	enum --|> type.
	enum --|> #TEnum.
	enum --|> #THasVisibility.
	enum --|> #TWithAttributes.

	enumValue --|> namedEntity.
	enumValue --|> #TStructuralEntity.
	enumValue --|> #TEnumValue.
	enumValue withPrecedenceOf: #TEnumValue.

	globalVariable --|> namedEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TInvocationsReceiver.

	implicitVariable --|> namedEntity.
	implicitVariable --|> #TImplicitVariable.
	implicitVariable --|> #TInvocationsReceiver.

	inheritance --|> #TInheritance.

	invocation --|> #TInvocation.
	invocation --|> #THasSignature.
	invocation --|> withArguments. 
	

	literal --|> #TAccessible.
	
	localVariable --|> namedEntity.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TCanBeFinal.
	localVariable --|> #TInvocationsReceiver.

	typeAlias --|> type.
	typeAlias --|> #TTypeAlias.


	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TWithAnnotationInstances.

	parameter --|> namedEntity.
	parameter --|> #TParameter.

	parameterType --|> type.
	parameterType --|> #TParameterType.

	primitiveType --|> type.
	primitiveType --|> #TPrimitiveType.
	
	dbType --|> type. 

	sourcedEntity --|> #TWithFiles.

	undefinedType --|> type.
	unknownType --|> type.
	 
	type --|> containerEntity.
	type --|> #TType.
	type --|> #TWithTypeAliases.
	type --|> #TParameterizedTypeUser.
	type --|> #TWithMethods.
	type --|> #TAccessible.

	unknownVariable --|> namedEntity.
	unknownVariable --|> #TUnknownVariable.
	unknownVariable --|> #TInvocationsReceiver
]

{ #category : #definition }
Alce2Generator >> defineProperties [

	super defineProperties.

	function property: #isExternal type: #Boolean.
	function property: #libraryName type: #String.

	subprocedure property: #isExternal type: #Boolean.
	subprocedure property: #libraryName type: #String.
	parameter property: #isOptional type: #Boolean.

	type property: #errorLoadingAST type: #Boolean.
	accessor property: #kind type: #String.
	accessor property: #attribute type: attribute fullName.


	constant property: #value type: #Object.

	accessModule property: #path type: #Object.

	argument property: #accesses type: #Object.

	accessWrite property: #isReturn type: #Boolean.
	accessWrite property: #isNewObject type: #Boolean.
	accessWrite property: #isProcessedAssignment type: #Boolean.
	accessWrite property: #readReference type: #Object.
	accessWrite property: #writeReference type: #Object.

	(argument property: #text type: #String) comment:
		'Textual code of the argument'.
	(access property: #readingAccess type: #Object) comment:
		'This property is only for using in the case of writing access. This readingAccess property should contain information about the reading accesses. '.

	access property: #context type: #Object.
	invocation property: #context type: #Object.
	literal property: #kind type: #String.
	literal property: #value type: #Object.
]

{ #category : #definition }
Alce2Generator >> defineRelations [

	super defineRelations.
	(project property: #modules) -* (accessModule property: #project).

	(accessModule property: #usedBy)
	*-* (accessModule property: #dependencies).
	(withArguments property: #arguments) -* (argument property: #activation).

]

{ #category : #definition }
Alce2Generator >> defineTraits [
	super defineTraits.
	
	withArguments  := builder newTraitNamed: #TWithArguments.
	

]

{ #category : #definition }
Alce2Generator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
