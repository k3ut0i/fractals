"
Complex Numbers
	+, -, *, /, reciprocal, conjugate
	
"
Class {
	#name : #Complex,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Newton-Fractals'
}

{ #category : #'instance creation' }
Complex class >> fromReal: realPart [
	^ self x: realPart y: 0
]

{ #category : #'instance creation' }
Complex class >> x: n1 y: n2 [
	| c |
	c := self new.
	c x: n1; y: n2.
	^ c
]

{ #category : #arithmetic }
Complex >> * cNumber [
	| x1 y1 xn yn|
	x1 := cNumber x.
	y1 := cNumber y.
	xn := (x*x1) - (y*y1).
	yn := (x*y1) + (x1*y).
	^ self class x: xn y: yn
]

{ #category : #arithmetic }
Complex >> + cNumber [
	^ self class x: (x + cNumber x) y: (y + cNumber y)
]

{ #category : #arithmetic }
Complex >> - cNumber [
	^ self class x: (x - cNumber x) y: (y - cNumber y)
]

{ #category : #arithmetic }
Complex >> / cNumber [
	^ self * cNumber reciprocal
]

{ #category : #comparing }
Complex >> = cNumber [
	^ (x = cNumber x) and: (y = cNumber y)
]

{ #category : #comparing }
Complex >> almost: delta equal: cNumber [

	"is self within delta of cNumber".
	^ (self - cNumber) magnitude < delta.
]

{ #category : #converting }
Complex >> asFloat [

	^ self class x: (x asFloat) y: (y asFloat).
]

{ #category : #testing }
Complex >> isZero [
	^ (x = 0) and: (y = 0)
]

{ #category : #accessing }
Complex >> magnitude [

	^ ((x * x) + (y *y)) sqrt
]

{ #category : #printing }
Complex >> printOn: aStream [
	(x printOn: aStream).
	aStream nextPutAll:  '+i'.
	(y printOn: aStream)
]

{ #category : #arithmetic }
Complex >> reciprocal [
	| d |
	d := (x * x) + (y * y).
	^ self class x: (x / d) y: (-1 * y / d)
]

{ #category : #accessing }
Complex >> x [
	^ x
]

{ #category : #accessing }
Complex >> x: num [
	x := num
]

{ #category : #accessing }
Complex >> y [
	^ y
]

{ #category : #accessing }
Complex >> y: num [
	y := num
]
