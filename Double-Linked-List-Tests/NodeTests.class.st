Class {
	#name : #NodeTests,
	#superclass : #TestCase,
	#instVars : [
		'myNode',
		'node1',
		'node2',
		'node3'
	],
	#category : #'Double-Linked-List-Tests'
}

{ #category : #running }
NodeTests >> setUp [
	super setUp.
	
	node1 := Node new.
	node2 := Node new.
	node3 := Node new.
]

{ #category : #tests }
NodeTests >> testNew [

self assert: node1 prev isNil.
self assert: node1 next isNil.
]
