Class {
	#name : #AlceLibraryReferenceImporter,
	#superclass : #JinLibraryReferenceVisitor,
	#traits : 'AlceTypeConversions',
	#classTraits : 'AlceTypeConversions classTrait',
	#category : #'Alce-Importer'
}

{ #category : #anchor }
AlceLibraryReferenceImporter >> dllAnchor: aString for: aJinLibraryConstant [

	^ self state top anchor / aString
]

{ #category : #'visiting accessor' }
AlceLibraryReferenceImporter >> instantiateGetterAccessorMethod: aJinLibraryMethod into: anAttribute [

	| acc selector |
	acc := self instantiate: AlcixAttributeAccessor.
	acc kind: #Get.
	selector := ('_' split: aJinLibraryMethod selector) last.
	acc selector: selector.
	acc typeName: (self typeName: aJinLibraryMethod).

	self state top addInvocable: acc.
	self state push: acc.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop.
	anAttribute addAttributeAccessor: acc
]

{ #category : #'instantiate accessors' }
AlceLibraryReferenceImporter >> instantiateSetterAccessorMethod: aJinLibraryMethod into: anAttribute [

	| acc selector |
	acc := self instantiate: AlcixAttributeAccessor.
	acc kind: #Set.

	selector := ('_' split: aJinLibraryMethod selector) last.
	acc selector: selector.
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

	| obj |
	obj := self instantiate: AlcixAlias.
	self state top addType: obj.
	obj name: aJinLibraryAlias name.
	obj anchor: self state top anchor / #alias / aJinLibraryAlias name.
	obj typeName:
		(self typeNameReference: aJinLibraryAlias aliaseeTypeName).
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryAttribute: aJinLibraryAttribute [

	| obj |
	obj := self instantiate: AlcixAlias.
	self state top addType: obj.
	obj name: aJinLibraryAttribute name.
	obj anchor:
		self state top anchor / #attributes / aJinLibraryAttribute name.
	obj typeName: (self typeNameReference: aJinLibraryAttribute typeName)
	


"visitLibraryAttribute: aJinLibraryAttribute

	| attr |
	attr := self instantiate: AlcixAttribute.
	attr name: aJinLibraryAttribute name.
	attr typeName:
		(self typeNameReference: aJinLibraryAttribute typeName).
	attr isConstant: false.
	attr visibility: #Public.
	attr anchor: (self dllAnchor: attr name for: aJinLibraryAttribute).
	self state top addMember: attr"
]

{ #category : #visiting }
AlceLibraryReferenceImporter >> visitLibraryCoClass: aJinLibraryCoClass [

	| obj typeName |
	typeName := aJinLibraryCoClass linkedType
		            ifNil: [ self undefinedTypeReference ]
		            ifNotNil: [ 
		            self typeNameReference:
			            aJinLibraryCoClass linkedType name ].
	obj := self instantiate: AlcixAlias.
	self state top addType: obj.
	obj name: aJinLibraryCoClass name.
	obj anchor:
		self state top anchor / #coclass / aJinLibraryCoClass name.
	obj typeName: typeName.
	

"visitLibraryCoClass: aJinLibraryCoClass

	| attr typeName |
	attr := self instantiate: AlcixAttribute.
	attr visibility: #Public.
	attr name: aJinLibraryCoClass name.
	attr anchor: (self dllAnchor: attr name for: aJinLibraryCoClass).
	attr isConstant: true.
	typeName := aJinLibraryCoClass linkedType
		            ifNil: [ self undefinedTypeReference ]
		            ifNotNil: [ 
		            self typeNameReference:
			            aJinLibraryCoClass linkedType name ].
	attr typeName: typeName.

	attr anchor: self state top anchor / #attributes / attr name.
	self state top addMember: attr"
]

{ #category : #accessing }
AlceLibraryReferenceImporter >> visitLibraryConstant: aJinLibraryConstant [

	| fn |
	fn := self instantiate: AlcixAttribute.
	fn visibility: #Public.
	fn name: aJinLibraryConstant name.
	fn anchor: (self dllAnchor: fn name for: aJinLibraryConstant).
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

	| fn selector |
	fn := self instantiate: AlcixFunction.
	selector := ('_' split: aJinLibraryFunction selector) last.
	fn selector: selector.
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
	| fn  selector |
	 
	fn := self instantiate: AlcixFunction.
	selector :=( '_' split: aJinLibraryMethod selector) last.  
	fn selector: selector.
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
	attribute anchor:
		(self dllAnchor: attribute name for: aJinLibraryProperty).

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
