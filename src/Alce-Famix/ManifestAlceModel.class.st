Class {
	#name : #ManifestAlceModel,
	#superclass : #PackageManifest,
	#category : #'Alce-Famix'
}

{ #category : #asserting }
ManifestAlceModel class >> shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages [
	^ false
]
