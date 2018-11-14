*----------------------------------------------------------------------
* Programmer: Quang Trinh
* Class Account: cssc0855
* Assignment or Title: Program #2
* Filename: prog2.s
* Date completed: 03.14.18 
*----------------------------------------------------------------------
* Problem statement: Create a loan payment calculator program.
* Input: Principle, interest rate APR, months
* Output: Monthly payment
* Error conditions tested: N/A 
* Included files: prog2.s
* Method and/or pseudocode: Floating-point number
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
start:  initIO                  		* Initialize (required for I/O)
		setEVT							* Error handling routines
		initF							* For floating point macros only	
		lineout		title				* Assignment information
		lineout 	prompt1
		floatin		buffer
		cvtaf		buffer,D1			* Principle(P)
	
		lineout		prompt2
		floatin		buffer
		cvtaf		buffer,D2			* Annual Interest rate
		fdiv		#$44960000,D2		* Monthly Interest rate(r)
	
		lineout		prompt3
		floatin		buffer
		cvtaf		buffer,D3			* Number of months(n)
	
		move.l		D2,D4				* Copy of interest rate(r)
		fadd.l		#$3f800000,D2		* (r+1)->D2
		fpow.l		D2,D3				* (r+1)^n->D0
		move.l		D0,D3				* Copy of (r+1)^n into D3
		fmul.l		D0,D4				* r(r+1)^n->D4
		fmul.l		D4,D1				* Pr(r+1)^n->D1
		fsub.l		#$3f800000,D3		* (r+1)^n-1->D3
		fdiv.l		D3,D1				* payment->D1
		cvtfa		payment,#2
		lineout		answer
	
        break                   		* Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations
title:		dc.b	'Program #2, cssc0855, Quang Trinh',0
prompt1:	dc.b	'Enter the amount of the loan:',0
prompt2:	dc.b	'Enter the annual percentage rate:',0
prompt3:	dc.b	'Enter the length of the loan in months:',0
buffer:		ds.b	80
answer:		dc.b	'Your monthly payment will be $'
payment:	ds.b	20		
        	end
