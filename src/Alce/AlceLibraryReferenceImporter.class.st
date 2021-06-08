Class {
	#name : #AlceLibraryReferenceImporter,
	#superclass : #JinLibraryReferenceVisitor,
	#traits : 'AlceTypeConversions',
	#classTraits : 'AlceTypeConversions classTrait',
	#category : #'Alce-Importer'
}

{ #category : #'visiting accessor' }
AlceLibraryReferenceImporter >> instantiateGetterAccessorMethod: aJinLibraryMethod into: anAttribute [

	| acc |

	acc := self instantiate: AlcixAttributeAccessor.
	acc kind: #Get.
	acc selector: aJinLibraryMethod selector.
	acc typeName: (self typeName: aJinLibraryMethod).

	self state top addInvocable: acc.
	self state push: acc.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop.
	anAttribute addAttributeAccessor: acc
]

{ #category : #'instantiate accessors' }
AlceLibraryReferenceImporter >> instantiateSetterAccessorMethod: aJinLibraryMethod into: anAttribute [ 

	| acc |
	acc := self instantiate: AlcixAttributeAccessor.
	acc kind: #Set.
	acc selector: aJinLibraryMethod selector.
	acc typeName: (self typeName: aJinLibraryMethod).

	self state top addInvocable: acc.
	self state push: acc.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop.
	anAttribute addAttributeAccessor: acc
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibrary: aJinLibrary [

	self visitCollection: aJinLibrary types .
	self visitCollection: aJinLibrary functions.
	
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryAlias: aJinLibraryAlias [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryAttribute: aJinLibraryAttribute [

	| attr |
	attr := self instantiate: AlcixAttribute.
	attr name: aJinLibraryAttribute name.
	attr typeName: (self typeNameReference: aJinLibraryAttribute typeName).
	attr isConstant: false. 
	attr visibility: #Public. 
	self state top addMember: attr
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryCoClass: aJinLibraryCoClass [

	| attr typeName |
	attr := self instantiate: AlcixAttribute.
	attr visibility: #Public.
	attr name: aJinLibraryCoClass name.
	attr isConstant: true.
	typeName := aJinLibraryCoClass linkedType
		            ifNil: [ self undefinedTypeReference ]
		            ifNotNil: [ 
		            self typeNameReference:
			            aJinLibraryCoClass linkedType name ].
	attr typeName: typeName.

	attr anchor: self state top anchor / #attributes / attr name.
	self state top addMember: attr
]

{ #category : #accessing }
AlceLibraryReferenceImporter >> visitLibraryConstant: aJinLibraryConstant [

	| fn |
	fn := self instantiate: AlcixAttribute.
	fn visibility: #Public.
	fn name: aJinLibraryConstant name.
	aJinLibraryConstant type
		ifNil: [ fn typeName: self undefinedTypeReference ]
		ifNotNil: [ :t | fn typeName: (self typeNameReference: t) ].
	fn isConstant: true.
	fn anchor: self state top anchor / #attributes / fn name.
	self state top addMember: fn
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryDispatchInterface: aJinLibraryDispatchInterface [ 
	^ self visitLibraryInterface: aJinLibraryDispatchInterface
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryEnum: aJinLibraryEnum [

	| en |
	en := self instantiate: AlcixEnum.
	en name: aJinLibraryEnum name.
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	aJinLibraryEnum values do: [ :d | 
		en addEnumValue: ((self instantiate: AlcixEnumValue)
				 name: d name;
				 Value: d value;
				 yourself) ]
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryFunction: aJinLibraryFunction [

	| fn |
	fn := self instantiate: AlcixFunction.
	fn selector: aJinLibraryFunction selector.
	fn anchor: self state top anchor / #functions / fn selector.
	fn typeName: self undefinedTypeReference.
	self state top addInvocable: fn
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryInterface: aJinLibraryInterface [ 

	| obj |
	obj := self instantiate: AlcixClass.
	self state top addType: obj.
	obj name: aJinLibraryInterface name.
	obj anchor: self state top anchor / #interfaces / aJinLibraryInterface name.

	self state push: obj.
	self visitCollection: aJinLibraryInterface definitions.

	self state pop
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryMethod: aJinLibraryMethod [ 
	| fn |
	 
	fn := self instantiate: AlcixFunction.
	fn selector: aJinLibraryMethod selector.
	fn anchor: self state top anchor / #functions / fn selector.
	fn typeName: (self typeName: aJinLibraryMethod) .
	
	self state top addInvocable: fn.
	self state push: fn.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryModule: aModule [

	| obj |
	obj := self instantiate: AlcixModule.
	self state top addType: obj.
	obj name: aModule name.
	obj anchor: self state top anchor / #modules / aModule name.

	self state push: obj.
	self visitCollection: aModule definitions.

	self state pop
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryParameter: aJinLibraryParameter [

	| param |
	param := self instantiate: AlcixParameter.
	param name: aJinLibraryParameter name.
	param typeName: (self typeNameReference: aJinLibraryParameter type).
	param isOptional: aJinLibraryParameter isOptional.
	self state top addParameter: param
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryProperty: aJinLibraryProperty [

	| attribute acc |
	attribute := self instantiate: AlcixAttribute.
	attribute name: aJinLibraryProperty name.


	attribute visibility: (aJinLibraryProperty name first = $_
			 ifTrue: [ #Private ]
			 ifFalse: [ #Public ]).

	attribute isConstant: false.
	attribute anchor:
		self state top anchor / #attributes / attribute name.

	self state top addMember: attribute.
	self assert: aJinLibraryProperty type isNil.

	aJinLibraryProperty getter ifNotNil: [ 
		self
			instantiateGetterAccessorMethod: aJinLibraryProperty getter
			into: attribute.
		attribute typeName: attribute attributeAccessors first typeName ].
	aJinLibraryProperty setter ifNotNil: [ 
		self
			instantiateSetterAccessorMethod: aJinLibraryProperty setter
			into: attribute ]
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryStructure: aJinLibraryStructure [

	| obj |
	obj := self instantiate: AlcixStructure.
	self state top addType: obj.
	obj name: aJinLibraryStructure name.
	obj anchor:
		self state top anchor / #structures / aJinLibraryStructure name.

	self state push: obj.
	self visitCollection: aJinLibraryStructure definitions.

	self state pop
]

{ #category : #'visit-first-objects' }
AlceLibraryReferenceImporter >> visitReference: aReference [ 
	aReference library accept: self 
]
