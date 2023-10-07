Class {
	#name : #MyList,
	#superclass : #Object,
	#instVars : [
		'tail',
		'head'
	],
	#category : #'Double-Linked-List'
}

{ #category : #adding }
MyList >> add: aValue [

	| prevTail node|
	node := Node new value: aValue .
	head ifNil: [ head := node.
						tail := node.
						^ aValue ].				
	tail ifNotNil: [ prevTail := tail ].
	prevTail next: node.
	node prev: prevTail .
	self tail: node.
	^ aValue
]

{ #category : #adding }
MyList >> head [

^ head
]

{ #category : #adding }
MyList >> head: aNode [

head := aNode
]

{ #category : #adding }
MyList >> includes: aValue [

	| current |
	current := head.
	 [ current isNil ] whileFalse: [
        (current value = aValue)
            ifTrue: [ ^ true ] 
            ifFalse: [ current := current next ] 
    ].
^ false
]

{ #category : #adding }
MyList >> tail [ 

^ tail
]

{ #category : #adding }
MyList >> tail: aNode [

tail := aNode
]
