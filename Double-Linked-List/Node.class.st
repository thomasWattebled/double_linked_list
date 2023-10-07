Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'value',
		'prevNode',
		'nextNode'
	],
	#category : #'Double-Linked-List'
}

{ #category : #accessing }
Node >> next [

	^ nextNode.
]

{ #category : #accessing }
Node >> next: aNode [

	nextNode  := aNode .
]

{ #category : #accessing }
Node >> prev [

	^ prevNode.
]

{ #category : #accessing }
Node >> prev: aNode [

	prevNode := aNode .
]

{ #category : #accessing }
Node >> value [ 

	^ value.
]

{ #category : #accessing }
Node >> value: anInteger [

	value := anInteger .
]
