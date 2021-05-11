Extension { #name : #JinQuery }

{ #category : #'*Alce' }
JinQuery >> tables [
	[ ^ (PostgreSQLParser parseSelectQuery: self sql toPG) fromClause
		items collect: [ :i | i tableName identifier ] ]
		on: Error
		do: [ ^ {} ]
]
