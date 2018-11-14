*----------------------------------------------------------------------
* Programmer: Quang Trinh 
* Class Account: cssc0855
* Assignment or Title: prog1
* Filename: prog1.s
* Date completed: 02.27.18 
*----------------------------------------------------------------------
* Problem statement: Convert integers into strings.
* Input: Read integers in the range 0..20 from the keyboard.
* Output: Print English word that corresponds with the number entered.
* Error conditions tested: N/A
* Included files: prog1.s
* Method and/or pseudocode: N/A 
* References: N/A
*----------------------------------------------------------------------
*
        ORG     $0
        DC.L    $3000           * Stack pointer value after a reset
        DC.L    start           * Program counter value after a reset
        ORG     $3000           * Start at location 3000 Hex
*
*----------------------------------------------------------------------
*
#minclude /home/cs/faculty/riggins/bsvc/macros/iomacs.s
#minclude /home/cs/faculty/riggins/bsvc/macros/evtmacs.s
*
*----------------------------------------------------------------------
*
* Register use
*
*----------------------------------------------------------------------
*
start:  initIO                  	* Initialize (required for I/O)
		setEVT						* Error handling routines
*		initF						* For floating point macros only	
		lineout		title
		lineout		newline
		lineout		prompt
		linein		buffer
		cvta2		buffer,D0
		mulu		#12,D0			*index*12
		lea			num,A0
		adda.l		D0,A0			*source
		lea			number,A1		*destination
		move.l		(A0)+,(A1)+
		move.l		(A0)+,(A1)+
		move.l		(A0)+,(A1)
		lineout		answer	
        break                   	* Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations
num:		dc.b	'zero.      ',0
			dc.b	'one.       ',0
			dc.b	'two.       ',0
			dc.b	'three.     ',0
			dc.b	'four.      ',0
			dc.b	'five.      ',0
			dc.b	'six.       ',0
			dc.b	'seven.     ',0
			dc.b	'eight.     ',0
			dc.b	'nine.      ',0
			dc.b	'ten.       ',0
			dc.b	'eleven.    ',0
			dc.b	'twelve.    ',0
			dc.b	'thirteen.  ',0
			dc.b	'fourteen.  ',0
			dc.b	'fifteen.   ',0
			dc.b	'sixteen.   ',0
			dc.b	'seventeen. ',0
			dc.b	'eightteen. ',0
			dc.b	'nineteen.  ',0
			dc.b	'twenty.    ',
newline: 	dc.b	0
title:		dc.b	'Program #1, Quang Trinh, cssc0855',0
prompt:		dc.b	'Please enter an integer',0
buffer:		ds.b	80
answer: 	dc.b	'The number you entered is '
number:		ds.b	14
        	end
