	.global main
	.text
main:
	la 	a0, strWelcome	# load string at strWelcome into a0
	li 	a7, 4		# print a0 because 4 goes into a7 (print string)
	ecall			# system call
	
while_outer:
	la 	a0, newLine	# load string at newLine into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	la 	a0, newLine	# load string at newLine into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	
	la 	a0, strPlease	# load string at strPlease into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	li 	a7, 5		# get user input and put into a0 (int)
	ecall			# system call
	
	li 	t4, 1		# set t4 to 1 to add to the counter
	li 	t2, 0		# set t2 to 0 to initialize a counter
	li 	t1, 0		# set t1 to 0 to add a0 to it
	add 	t1, t1, a0	# set t1 to a1
	
while_inner:	
		
	beqz 	t1, endwhile_inner	# leave loop if num = 0 (all shifted out)
if:
	and 	t3, t4, t1	# store result of num & 1 in t3
	#bne 	t1, t4, else	# if result doesn't equal 1, go to else
	add 	t2, t2, t3	# increase counter by 1
else:
	srl 	t1, t1, t4	# shift num to the right by 1 (bring in 0)
	b 	while_inner

endwhile_inner:	
	
	la 	a0, strThe	# load string at strThe into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	
	li 	a0, 0		# set a0 to 0
	add 	a0, a0, t2	# add counter to a0
	li 	a7, 1		# print a0 because 1 goes into a7
	ecall			# system call
	
	la 	a0, newLine	# load string at newLine into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	
	la 	a0, strContinue	# load string at strContinue into a0
	li 	a7, 4		# print a0 because 4 goes into a7
	ecall			# system call
	li 	a0, 0		# clear a0
	li 	a7 12		# get user input and put into a0 (char)
	ecall			# system call
	
	li 	t1, 110		# load ascii for "n" into t1
	beq	a0, t1, endwhile_outer # if input in a0 has same ascii as "n", branch to end of the loop
	b 	while_outer	# if not already branched to end, go back to top
	
endwhile_outer:
	la 	a0, exiting	# load string at exiting into a0
	li 	a7, 4		# print a0
	ecall			# system call
	
	li 	a7, 10		# exit the program
	ecall			# system call

	.data
strWelcome:	.string "Welcome to the CountOnes program."
strPlease:	.string "Please enter a number: "
strThe:		.string	"The number of bits set is: "
strContinue:	.string "Continue (y/n)?: "
newLine: 	.string "\n"
exiting:	.string "\nExiting\n"
