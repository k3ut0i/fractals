"
A Class to help analyze actual roots of a polynomial after a newton raphson scan of an area.

	`delta`: helps deal with precision issues of Newton-Rhapson method and floating point inaccuracies.
	
We take collection of roots obtained and cluster them using `delta`. These clusters are our main data.
Now for any given input value, we can return which cluster it belongs to and a corresponding error too.
"
Class {
	#name : #RootBin,
	#superclass : #Dictionary,
	#instVars : [
		'delta',
		'bins'
	],
	#category : #'Newton-Fractals'
}

{ #category : #'instance creation' }
RootBin class >> from: aCollection delta: delta [

	" Given a collection of values, cluster them into bins."

	| bins rootbin |
	bins := Dictionary new.
	aCollection do: [ :each | 
		| inBin binElem |
		inBin := false.
		binElem := nil.
		bins keysDo: [ :key | 
			(key almost: delta equal: each) ifTrue: [ 
				inBin := true.
				binElem := key ] ].
		inBin
			ifTrue: [ 
				| e |
				e := bins at: binElem.
				e add: each.
				bins at: binElem put: e ]
			ifFalse: [ bins add: each -> LinkedList new ] ].
	rootbin :=  self new. 
	rootbin bins: bins. "(Set newFrom: bins keys)."
	^ rootbin
]

{ #category : #accessing }
RootBin >> bins [

	^ bins
]

{ #category : #accessing }
RootBin >> bins: b [

	bins := b
]

{ #category : #accessing }
RootBin >> delta [

	^ delta
]

{ #category : #accessing }
RootBin >> delta: d [

	delta := d.
]
