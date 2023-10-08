Class {
	#name : #MyListTests,
	#superclass : #TestCase,
	#instVars : [
		'list1',
		'node1',
		'node2',
		'node3'
	],
	#category : #'Double-Linked-List-Tests'
}

{ #category : #running }
MyListTests >> setUp [
	super setUp.
	
	list1 := MyList new.
]

{ #category : #running }
MyListTests >> testAddAfter [
	
	list1 add: 10.
	
	self assert: (list1 add: 15) equals: 15.
	list1 add:5 after:10.
	self assert: list1 size equals:3.
	self assert: list1 head next value equals:5.
	
]

{ #category : #running }
MyListTests >> testAddBefore [
	
	list1 add: 10.
	list1 add:5 before:10.
	self assert: list1 size equals:2.
	self assert: list1 head value equals:5.
	list1 add:15 before:10.
	self assert: list1 head next value equals:10.
	
]

{ #category : #running }
MyListTests >> testFind [

	list1 add: 10.
	self deny: (list1 find: 15).
	list1 add:15.
	self assert: (list1 find:15) equals: list1 tail
	
]

{ #category : #running }
MyListTests >> testHead [

	list1 add: 10.
	self assert: list1 head value equals:10.
	list1 add:5.
	self assert: list1 head value equals:10.
	list1 add: 15 before: 10.
	self assert: list1 head value equals:15.
	
]

{ #category : #running }
MyListTests >> testIsEmpty [
	
	self assert: list1 isEmpty.
	list1 add: 10.
	self deny: list1 isEmpty.
	self assert: list1 head value equals: 10
]

{ #category : #running }
MyListTests >> testSize [
	
	list1 add: 10.
	self assert: list1 size equals: 1.
	list1 add: 5.
	self assert: list1 size equals: 2.
]

{ #category : #running }
MyListTests >> testTail [

	list1 add: 10.
	self assert: list1 tail value equals:10.
	list1 add:5.
	self assert: list1 tail value equals:5.
	list1 add: 15 before: 10.
	self assert: list1 tail value equals:5.
	
]

{ #category : #running }
MyListTests >> testinclude [
	
	self deny:  (list1 includes:10) .
	list1 add: 10.
	self deny: (list1 includes:5).
	list1 add: 5.
	self assert: (list1 includes:5).
	
]
