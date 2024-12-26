"
A polynomial equation.
  - only natural number exponents.

"
Class {
	#name : #Polynomial,
	#superclass : #Object,
	#instVars : [
		'coefficients'
	],
	#category : #'Newton-Fractals'
}

{ #category : #accessing }
Polynomial >> coefficients [
	^ coefficients
]

{ #category : #accessing }
Polynomial >> coefficients: list [
	coefficients := list collect: [ :x | x asFloat ].
]

{ #category : #'mathematical functions' }
Polynomial >> derivative [

	| en i |
	en := self coefficients species new.
	i := 0.
	^ self class new
		  coefficients: (self coefficients collect: [ :each | 
					   i := i + 1.
					   i - 1 * each ]) allButFirst;
		  yourself
]

{ #category : #'mathematical functions' }
Polynomial >> eval: cNumber [

	| sum valToPower |
	sum := Complex fromReal: 0.
	valToPower := Complex fromReal: 1.
	self coefficients do: [ :each | 
		sum := sum + ((Complex fromReal: each) * valToPower).
		valToPower := valToPower * cNumber ].
	^ sum
]

{ #category : #'drawing - images' }
Polynomial >> fractal: numDots bounds: aRect [

	"newton fractal with numDots pixels along a unit length and bounded by aRect."

	| width height ds |
	width := (numDots * aRect width) ceiling.
	height := (numDots * aRect height) ceiling.
	ds := LinkedList new.
	0 to: width do: [ :w | 
		0 to: height do: [ :h | 
			| x y root |
			x := w / numDots + aRect origin x.
			y := h / numDots + aRect origin y.
			root := self newtonRaphsonFrom: (Complex x: x y: y) maxSteps: 1000.
			ds add: { 
					(x @ y).
					root } ] ].
	^ ds
	"	^ DotCanvas width: width height: height  dots: ds. "
]

{ #category : #'mathematical functions' }
Polynomial >> newtonRaphsonFrom: num maxSteps: ms [

	| root derPoly steps val |
	root := num asFloat.
	steps := 0.
	derPoly := self derivative.
	val := self eval: root.
	(derPoly eval: root) isZero ifTrue: [ 
		^ { 
			  false.
			  root.
			  0 } ].

	[ val isZero or: steps >= ms ] whileFalse: [ 
		| slope |
		slope := derPoly eval: root.
		steps := steps + 1.
		root := slope isZero
			        ifFalse: [ root - (val / slope) ]
			        ifTrue: [ root ].
		val := self eval: root ].
	val := self eval: root.
	val isZero
		ifTrue: [ 
			^ { 
				  true.
				  root.
				  steps } ]
		ifFalse: [ 
			^ { 
				  false.
				  root.
				  0 } ]
]
