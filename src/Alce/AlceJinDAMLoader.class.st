Class {
	#name : #AlceJinDAMLoader,
	#superclass : #Object,
	#instVars : [
		'dam',
		'alce',
		'stack',
		'instances',
		'settingReferences',
		'errors'
	],
	#category : #'Alce-Generator'
}

{ #category : #visiting }
AlceJinDAMLoader >> createType: aType for: aJinDAMClass [

	| type |
	type := self
		        instantiate: aType
		        for: aJinDAMClass
		        onCreation: [ :newType | 
			        newType name: aJinDAMClass name.

			        self currentConstruct addType: newType.
			        newType errorLoadingAST: aJinDAMClass astCannotLoad.
			        newType visibility: aJinDAMClass visibility asLowercase.

			        self push: newType during: [ 
				        self visitCollection: aJinDAMClass attributes.
				        self visitCollection: aJinDAMClass invocables.
						  self visitCollection: aJinDAMClass types.
				 ] ].
	self currentConstruct addType: type.
	^ type
]

{ #category : #'as yet unclassified' }
AlceJinDAMLoader >> currentConstruct [

	^ stack first 
]

{ #category : #initialization }
AlceJinDAMLoader >> ensureTableTypesAreCreated: anObj [
	(anObj isKindOf: JinDAMDBType ) ifTrue: [ 
		anObj accept: self .
  ].
	
	^ anObj
]

{ #category : #accessing }
AlceJinDAMLoader >> errors [
	 ^ errors ifNil: [ errors := OrderedCollection new  ]
]

{ #category : #initialization }
AlceJinDAMLoader >> initialize [
	super initialize .
	stack := Stack new .
]

{ #category : #accessing }
AlceJinDAMLoader >> instances [

	^ instances ifNil: [ instances := Dictionary new ]
]

{ #category : #visiting }
AlceJinDAMLoader >> instantiate: anAlceIXClass for: aJinDAMObject onCreation: aBlock [

	| obj |
	self instances at: aJinDAMObject ifPresent: [ :a | ^ a ].
	obj := alce instantiate: anAlceIXClass.

	self instances at: aJinDAMObject put: obj.
	aBlock value: obj.
	^ obj
]

{ #category : #initialization }
AlceJinDAMLoader >> load: aDamModel [

	^ self load: aDamModel into: AlceIXModel new
]

{ #category : #initialization }
AlceJinDAMLoader >> load: aDamModel into: anAlceModel [

	dam := aDamModel.
	alce := anAlceModel.
	aDamModel accept: self.
	self setReferences. 
	^ anAlceModel
]

{ #category : #initialization }
AlceJinDAMLoader >> push: aSomething during: aBlock [

	stack push: aSomething.
	[ ^ aBlock value ] ensure: [ stack pop ]
]

{ #category : #'as yet unclassified' }
AlceJinDAMLoader >> scheduleSettingReference: aReference into: anAlceIXEntity with: aSelector [

	self assert: (aReference isNil or: [ aReference isReference ]).
	self settingReferences add: aReference -> { 
			anAlceIXEntity.
			aSelector }
]

{ #category : #initialization }
AlceJinDAMLoader >> setErrorRefs [

	| refs |
	refs := errors.
	errors := OrderedCollection new.
	self setRefsInCollection: (refs collect:#first)
]

{ #category : #initialization }
AlceJinDAMLoader >> setReferences [
	errors := OrderedCollection new. 
	self setRefsInCollection: settingReferences 
]

{ #category : #initialization }
AlceJinDAMLoader >> setRefsInCollection: aCollection [
	| reference destination selector arg refGat |
	refGat := AlceReferenceGatherer new.
	aCollection do: [ :refToObj | 
		reference := refToObj key.
		destination := refToObj value first.
		selector := refToObj value second.


		reference isNil ifFalse: [ 
			reference isMultipleReference
				ifTrue: [  ]
				ifFalse: [ 
					[ 
					arg := reference isLiteralReference
						       ifFalse: [ 
							       reference candidate isCollection
								       ifTrue: [ 
								       reference candidate detect: [ :a | a isAttributeGetter ] ]
								       ifFalse: [ 
								       self ensureTableTypesAreCreated: reference candidate ] ]
						       ifTrue: [ 
							       self push: refGat during: [ reference accept: self ].
							       reference ].

					arg
						ifNil: [ 
							reference isUndefinedType
								ifTrue: [ 
									arg := self
										       instantiate: AlceIXUndefinedType
										       for: reference
										       onCreation: [ :a |  ] ]
								ifFalse: [ 
									reference isUnknownType
										ifTrue: [ 
											arg := self
												       instantiate: AlceIXUnknownType
												       for: reference
												       onCreation: [ :a |  ] ]
										ifFalse: [ 
											arg := self
												       instantiate: AlceIXUnknownVariable
												       for: reference
												       onCreation: [ :a |  ] ].
									arg name: reference name ] ]
						ifNotNil: [ arg := instances at: arg ].

					destination perform: selector withArguments: { arg } ]
						on: Error
						do: [ :e | 
							
							self errors add: { 
									refToObj.
									e messageText } ] ] ] ]
]

{ #category : #'as yet unclassified' }
AlceJinDAMLoader >> settingReferences [
	^ settingReferences ifNil: [ settingReferences := OrderedCollection new  ]
]

{ #category : #visiting }
AlceJinDAMLoader >> visitAccessModule: aJinDAMAccessModule [

	| module |

	module := self instantiate: AlceIXAccessModule for: aJinDAMAccessModule onCreation: [  : newModule |
			newModule name: aJinDAMAccessModule name.
			newModule path: aJinDAMAccessModule path. 
			self push: newModule during: [ 
			self visitCollection: aJinDAMAccessModule types.
			self visitCollection: aJinDAMAccessModule dependencies.
			self visitCollection: aJinDAMAccessModule globals.
		 ]
	].
	self currentConstruct addModule: module.



]

{ #category : #visiting }
AlceJinDAMLoader >> visitAccessRead: aJinDAMAccessRead [

	| acc refGather |
	refGather := AlceReferenceGatherer new.

	self
		push: refGather
		during: [ aJinDAMAccessRead readReference accept: self ].
	
	refGather references do: [ : a| 
		a setUnderContextOf: self currentConstruct .
	].
	^ acc
]

{ #category : #visiting }
AlceJinDAMLoader >> visitAccessWrite: aJinDAMAccessWrite [

	| acc refGather |
	acc := self
		       instantiate: AlceIXAccessWrite
		       for: aJinDAMAccessWrite
		       onCreation: [ :write | 
			       refGather := AlceReferenceGatherer new.

			       self
				       push: refGather
				       during: [ aJinDAMAccessWrite writeReference accept: self ].

			       refGather references do: [ :a | a setUnderContextOf: write ].
			       refGather := AlceReferenceGatherer new.
			       self
				       push: refGather
				       during: [ 
				       self visitCollection: aJinDAMAccessWrite readReferences ].

			       refGather references do: [ :a | a setUnderContextOf: write ] ].

	self currentConstruct addAccess: acc.
	^ acc
]

{ #category : #visiting }
AlceJinDAMLoader >> visitAlias: aJinDAMAlias [

	| al |
	al := self
		      instantiate: AlceIXTypeAlias
		      for: aJinDAMAlias
		      onCreation: [ :alias | 
			      alias name: aJinDAMAlias name.
			      self
				      scheduleSettingReference: aJinDAMAlias typeReference
				      into: alias
				      with: #declaredType: ].
	self currentConstruct addType: al
]

{ #category : #visiting }
AlceJinDAMLoader >> visitArgument: aJinDAMArgument [

	| arg |
	arg := self
		       instantiate: AlceIXArgument
		       for: aJinDAMArgument
		       onCreation: [ :argument | 
			       argument text: aJinDAMArgument text.
			       self
				       push: argument
				       during: [ self visitCollection: aJinDAMArgument reads ] ].
	self currentConstruct addArgument: arg
]

{ #category : #visiting }
AlceJinDAMLoader >> visitAttribute: aJinDAMAttribute [ 
	| attribute refGat |

	attribute := self instantiate: AlceIXAttribute  for:  aJinDAMAttribute onCreation: [ :newAttr | 
		newAttr name: aJinDAMAttribute name.
		
		newAttr visibility: aJinDAMAttribute visibility asLowercase.
		self scheduleSettingReference: aJinDAMAttribute typeReference into: newAttr with: #declaredType:.

	 ].
	self currentConstruct addAttribute: attribute .
	^ attribute  
]

{ #category : #visiting }
AlceJinDAMLoader >> visitAttributeAccessor: aJinDAMAttributeAccessor [

	| acc refGat |
	acc := self
		       instantiate: AlceIXAccessor
		       for: aJinDAMAttributeAccessor
		       onCreation: [ :newFn | 
			       newFn name: aJinDAMAttributeAccessor name.
			       newFn signature: aJinDAMAttributeAccessor signature.
			       newFn kind: aJinDAMAttributeAccessor kind.
			       aJinDAMAttributeAccessor attribute ifNotNil: [ 
				       newFn attribute:
					       (aJinDAMAttributeAccessor attribute accept: self) ].
			       self
				       push: newFn
				       during: [ 
				       self visitCollection: aJinDAMAttributeAccessor parameters ].
			       aJinDAMAttributeAccessor isGet ifTrue: [ 
				     

				       self
					       scheduleSettingReference:
					       aJinDAMAttributeAccessor typeReference
					       into: newFn
					       with: #declaredType: ] ].
	self currentConstruct addMethod: acc
]

{ #category : #visiting }
AlceJinDAMLoader >> visitClass: aJinDAMClass [

	^ self createType: AlceIXClass for: aJinDAMClass
]

{ #category : #visiting }
AlceJinDAMLoader >> visitCollection: aCollection [

	^ aCollection collect: [ :v | v accept: self ]
]

{ #category : #visiting }
AlceJinDAMLoader >> visitConstant: aJinDAMConstant [

	| const |
	const := self
		         instantiate: AlceIXConstant
		         for: aJinDAMConstant
		         onCreation: [ :c | 
			         c name: aJinDAMConstant name.
			         self
				         scheduleSettingReference: aJinDAMConstant typeReference
				         into: c
				         with: #declaredType:.
			         aJinDAMConstant value ifNotNil: [ 
				         (aJinDAMConstant value asCollection collect:
					          #readReference) do: [ :ref | 
					         self scheduleSettingReference: ref into: c with: #value: ] ] ]
]

{ #category : #'as yet unclassified' }
AlceJinDAMLoader >> visitDBType: aDbType [

	self
		instantiate: AlceIXDBType
		for: aDbType
		onCreation: [ :p | p name: aDbType name ]
]

{ #category : #visiting }
AlceJinDAMLoader >> visitEnum: aJinDAMEnum [

	| en |
	en := self
		      instantiate: AlceIXEnum
		      for: aJinDAMEnum
		      onCreation: [ :enum | 
			      enum name: aJinDAMEnum name.
			      enum enumValues: (self visitCollection: aJinDAMEnum values) ].
	self currentConstruct addType: en.
	^ en
]

{ #category : #visiting }
AlceJinDAMLoader >> visitEnumValue: aJinDAMEnumValue [

	| ev |
	ev := self
		      instantiate: AlceIXEnumValue
		      for: aJinDAMEnumValue
		      onCreation: [ :val | val name: aJinDAMEnumValue name ].
	^ ev
]

{ #category : #visiting }
AlceJinDAMLoader >> visitEvent: aJinDAMEvent [

	| evt |
	evt := self
		       instantiate: AlceIXEvent
		       for: aJinDAMEvent
		       onCreation: [ :newEvent | 
			       newEvent name: aJinDAMEvent name.
			       newEvent signature: aJinDAMEvent signature.
			       self
				       push: newEvent
				       during: [ self visitCollection: aJinDAMEvent parameters ] ].
	self currentConstruct addMethod: evt.
	^ evt
]

{ #category : #visiting }
AlceJinDAMLoader >> visitExternalFunction: aJinDAMExternalFunction [

	| fn |
	fn := self
		      instantiate: AlceIXFunction
		      for: aJinDAMExternalFunction
		      onCreation: [ :newFn | 
			      newFn name: aJinDAMExternalFunction name.
			      newFn signature: aJinDAMExternalFunction signature.
			      newFn isExternal: true.
			      newFn libraryName: aJinDAMExternalFunction libraryName.

			      self
				      push: newFn
				      during: [ 
				      self visitCollection: aJinDAMExternalFunction parameters ].
			      self
				      scheduleSettingReference:
				      aJinDAMExternalFunction typeReference
				      into: newFn
				      with: #declaredType: ].
	self currentConstruct addMethod: fn.
	^ fn
]

{ #category : #visiting }
AlceJinDAMLoader >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [

	| sub |
	sub := self
		       instantiate: AlceIXSubProcedure
		       for: aJinDAMExternalSubProcedure
		       onCreation: [ :newSub | 
			       newSub name: aJinDAMExternalSubProcedure name.
			       newSub signature: aJinDAMExternalSubProcedure signature.
			       newSub isExternal: true.
			       newSub libraryName: aJinDAMExternalSubProcedure libraryName.
			       self
				       push: newSub
				       during: [ 
				       self visitCollection:
					       aJinDAMExternalSubProcedure parameters ] ].
	self currentConstruct addMethod: sub.
	^ sub
]

{ #category : #visiting }
AlceJinDAMLoader >> visitForm: aJinDAMForm [

	^ self createType: AlceIXForm for: aJinDAMForm
]

{ #category : #visiting }
AlceJinDAMLoader >> visitFunction: aJinDAMFunction [

	| fn refGat |
	fn := self
		      instantiate: AlceIXFunction
		      for: aJinDAMFunction
		      onCreation: [ :newFn | 
			      newFn name: aJinDAMFunction name.
			      newFn signature: aJinDAMFunction signature.
			      self push: newFn during: [ 
				      self visitCollection: aJinDAMFunction parameters.
				      self visitCollection: aJinDAMFunction localVariables.
				      self visitCollection: aJinDAMFunction accesses ].

			      self
				      scheduleSettingReference: aJinDAMFunction typeReference
				      into: newFn
				      with: #declaredType: ].
	self currentConstruct addMethod: fn.
	^ fn
]

{ #category : #visiting }
AlceJinDAMLoader >> visitLibrary: aJinDAMLibrary [

	| module |
	module := self
		          instantiate: AlceIXLibrary
		          for: aJinDAMLibrary
		          onCreation: [ :newModule | 
			          newModule name: aJinDAMLibrary name.
			          newModule path: aJinDAMLibrary path.
			          self push: newModule during: [ 
				          self visitCollection: aJinDAMLibrary types.
				          self visitCollection: aJinDAMLibrary globals ] ].
	self currentConstruct addModule: module.

	^ module
]

{ #category : #visiting }
AlceJinDAMLoader >> visitLibraryReference: aJinDAMLibraryReference [

	^ self visitMemberReference: aJinDAMLibraryReference
]

{ #category : #visiting }
AlceJinDAMLoader >> visitLiteralReference: aJinDAMLiteralReference [

	| lit |
	lit := self
		       instantiate: AlceIXLiteral
		       for: aJinDAMLiteralReference
		       onCreation: [ :literal | 
			       literal kind: aJinDAMLiteralReference kind.
			       literal value: aJinDAMLiteralReference candidate ].
	self currentConstruct addReference: lit.
	^ lit
]

{ #category : #visiting }
AlceJinDAMLoader >> visitLocalVariable: aJinDAMLocalVariable [

	| var |
	var := self
		       instantiate: AlceIXLocalVariable
		       for: aJinDAMLocalVariable
		       onCreation: [ :variable | 
			       variable name: aJinDAMLocalVariable name.
			       self
				       scheduleSettingReference:
				       aJinDAMLocalVariable typeReference
				       into: variable
				       with: #declaredType: ].
	self currentConstruct addLocalVariable: var.
	^ var
]

{ #category : #visiting }
AlceJinDAMLoader >> visitMemberReference: aJinDAMMemberReference [

	| ref refGat |
	aJinDAMMemberReference context isReference ifTrue: [ 
		refGat := AlceReferenceGatherer new.
		self
			push: refGat
			during: [ aJinDAMMemberReference context accept: self ] ].

	aJinDAMMemberReference isUnknownReference ifTrue: [ ^ self ].

	aJinDAMMemberReference isInvocableReference
		ifTrue: [ 
			ref := self
				       instantiate: AlceIXInvocation
				       for: aJinDAMMemberReference
				       onCreation: [ :invocation | 
					       invocation signature: aJinDAMMemberReference signature.
					       self
						       scheduleSettingReference: aJinDAMMemberReference
						       into: invocation
						       with: #addCandidate:.
					       self
						       push: invocation
						       during: [ 
						       self visitCollection: aJinDAMMemberReference arguments ] ] ]
		ifFalse: [ 
			aJinDAMMemberReference isVariableReference
				ifTrue: [ 
					ref := self
						       instantiate: AlceIXAccess
						       for: aJinDAMMemberReference
						       onCreation: [ :access | 
							       access name: aJinDAMMemberReference name.
							       self
								       scheduleSettingReference: aJinDAMMemberReference
								       into: access
								       with: #addAccess:.
							       self
								       push: access
								       during: [ 
								       self visitCollection: aJinDAMMemberReference arguments ] ] ]
				ifFalse: [ self halt ] ].

	refGat ifNotNil: [ 
		self assert: refGat references size = 1.
		ref context: refGat references first ].

	self currentConstruct addReference: ref.
	^ ref
]

{ #category : #visiting }
AlceJinDAMLoader >> visitModel: aJinDAMModel [

	| modules project |
	modules := aJinDAMModel entities select: [ :a | a isAccessModule ].
	project := self
		           instantiate: AlceIXAccessProject
		           for: aJinDAMModel
		           onCreation: [ :newProject | 
			           self
				           push: newProject
				           during: [ self visitCollection: modules ] ].
	^ project
]

{ #category : #visiting }
AlceJinDAMLoader >> visitModule: aJinDAMModule [

	^ self createType: AlceIXModule for: aJinDAMModule
]

{ #category : #visiting }
AlceJinDAMLoader >> visitParameter: aJinDAMParameter [

	| parameter |
	parameter := self
		             instantiate: AlceIXParameter
		             for: aJinDAMParameter
		             onCreation: [ :newParam | 
			             newParam isOptional: aJinDAMParameter isOptional.
			             newParam name: aJinDAMParameter name.

			             self
				             scheduleSettingReference:
				             aJinDAMParameter typeReference
				             into: newParam
				             with: #declaredType: ].
	^ parameter
]

{ #category : #visiting }
AlceJinDAMLoader >> visitPrimitiveType: aJinDAMPrimitiveType [

	| pt |
	pt := self
		      instantiate: AlceIXPrimitiveType
		      for: aJinDAMPrimitiveType
		      onCreation: [ :primitiveType | 
		      primitiveType name: aJinDAMPrimitiveType name ].
	self currentConstruct addType: pt.
	^ pt
]

{ #category : #visiting }
AlceJinDAMLoader >> visitQuery: aJinDAMQuery [

	^ self createType: AlceIXQuery for: aJinDAMQuery
]

{ #category : #visiting }
AlceJinDAMLoader >> visitReport: aJinDAMReport [

	^ self createType: AlceIXReport for: aJinDAMReport
]

{ #category : #visiting }
AlceJinDAMLoader >> visitStructure: aJinDAMStructure [

	| str |
	str := self
		       instantiate: AlceIXStruct
		       for: aJinDAMStructure
		       onCreation: [ :struct | 
			       struct name: aJinDAMStructure name.
			       struct visibility: aJinDAMStructure visibility asLowercase.
			       self
				       push: struct
				       during: [ 
				       self visitCollection: aJinDAMStructure attributes ] ].
	^ str
]

{ #category : #visiting }
AlceJinDAMLoader >> visitSubProcedure: aJinDAMSubProcedure [

	| sub |
	sub := self
		       instantiate: AlceIXSubProcedure
		       for: aJinDAMSubProcedure
		       onCreation: [ :newSub | 
			       newSub name: aJinDAMSubProcedure name.
			       newSub signature: aJinDAMSubProcedure signature.
			       self push: newSub during: [ 
				       self visitCollection: aJinDAMSubProcedure parameters.
				       self visitCollection: aJinDAMSubProcedure localVariables.
				       self visitCollection: aJinDAMSubProcedure accesses ] ].
	self currentConstruct addMethod: sub.
	^ sub
]

{ #category : #visiting }
AlceJinDAMLoader >> visitTable: aJinDAMTable [

	^ self createType: AlceIXTable for: aJinDAMTable
]

{ #category : #visiting }
AlceJinDAMLoader >> visitTableField: aJinDAMTableField [

	| attribute |
	attribute := self
		             instantiate: AlceIXAttribute
		             for: aJinDAMTableField
		             onCreation: [ :newAttr | 
			             newAttr name: aJinDAMTableField name.

			             self
				             scheduleSettingReference:
				             aJinDAMTableField typeReference
				             into: newAttr
				             with: #declaredType: ].
	self currentConstruct addAttribute: attribute.
	^ attribute
]

{ #category : #visiting }
AlceJinDAMLoader >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	^ self visitMemberReference: aJinDAMTypeMemberReference
]

{ #category : #visiting }
AlceJinDAMLoader >> visitTypeReference: aJinDAMTypeReference [

	^ self visitMemberReference: aJinDAMTypeReference
]

{ #category : #visiting }
AlceJinDAMLoader >> visitUserType: aJinDAMUserType [ 
	| str |
	str := self
		       instantiate: AlceIXStruct
		       for: aJinDAMUserType
		       onCreation: [ :struct | 
			       struct name: aJinDAMUserType name.
			       struct visibility: aJinDAMUserType visibility asLowercase.
			       self
				       push: struct
				       during: [ 
				       self visitCollection: aJinDAMUserType attributes ] ].
	^ str
]
