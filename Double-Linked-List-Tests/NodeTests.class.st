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
	node1 value:15.
	node2 := Node new.
	node2 value:10.
	node3 := Node new.
]

{ #category : #tests }
NodeTests >> testNew [

self assert: node1 prev isNil.
self assert: node1 next isNil.
]

{ #category : #tests }
NodeTests >> testNext [

self assert: node1 next isNil .
node1 next: node2.
self assert: node1 next equals: node2.
]

{ #category : #tests }
NodeTests >> testPrev [

self assert: node2 prev isNil .
node2 prev: node1.
self assert: node2 prev equals: node1.
]

{ #category : #tests }
NodeTests >> testValue [

node3 value: 5.
self assert: node3 value equals: 5.
]
