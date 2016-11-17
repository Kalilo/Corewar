#This is a test file

.name       "singularity v1.0"
.comment    "The more it consumes, the more it is able to consume."

pre:
	st		r1, r14
	st		r3, -4

start:
	st		r14, 6
	live	%0
	fork	%:init_bot
	st		r14, 6
	live	%0
	fork	%:fork_bomb
	st		r14, 6
	live	%0
	fork	%:be_alive
	st		r14, 6
	live	%0
	fork	%:leak
	st		r14, 6
	live	%0
	fork	%:be_alive2

fork_bomb:
	st		r14, 6
	live	%0
	fork	%:fork_bomb
	st		r14, 6
	live	%0
	fork	%:fork_bomb
	st		r14, 6
	live	%0
	fork	%:fork_bomb
	st		r14, 6
	live	%0
	zjmp	%:fork_bomb

be_alive:
	st		r14, 6
	live	%0
	sti		r14,%:so_alive,%1
	sti		r14,%:so_alive,%6
	sti		r14,%:so_alive,%11
	sti 	r14,%:so_alive,%16
	sti 	r14,%:so_alive,%21
	sti 	r14,%:so_alive,%26
	sti 	r14,%:so_alive,%31
	sti 	r14,%:so_alive,%36
	sti 	r14,%:so_alive,%41
	sti 	r14,%:so_alive,%46
	sti 	r14,%:so_alive,%51
	sti 	r14,%:so_alive,%63

so_alive:
	live	%1
	live	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	ld 		%0,r6
	live 	%1
	zjmp 	%:so_alive

leak:
	st		r14, 6
	live	%0
	fork	%:leak
	st		r14, 6
	live	%0
	fork	%:leak
	st		r14, 6
	live	%0
	fork	%:leak
	st		r14, 6
	live	%0
	fork	%:start
	ld		%0, r15
	zjmp	%:leak

be_alive2:
	st		r14, 6
	live	%0
	sti		r14,%:so_alive2,%1
	sti		r14,%:so_alive2,%6
	sti		r14,%:so_alive2,%11
	sti 	r14,%:so_alive2,%16
	sti 	r14,%:so_alive2,%21
	sti 	r14,%:so_alive2,%26
	sti 	r14,%:so_alive2,%31
	sti 	r14,%:so_alive2,%36
	sti 	r14,%:so_alive2,%41
	sti 	r14,%:so_alive2,%46
	sti 	r14,%:so_alive2,%51
	sti 	r14,%:so_alive2,%63
	
so_alive2:
	live	%1
	live	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	live 	%1
	ld 		%0,r6
	live 	%1
	zjmp 	%:so_alive2

init_bot:
	sti		r14, %:p2, %19
	st		r14, 6 
	live	%0
	fork	%:init_bot
	fork	%:f2

f1:
	st		r14, 6
	live	%0
	fork	%:p2

p1:
	st		r14, 6
	live	%0
	ld		%6, r3
	ld		%16777216, r4 ; live (01 00 00 00)
	ld		%0, r15
	zjmp	%:start_bot

p2:
	st		r14, 6
	live	%0
	ld		%7, r3
	ld		%1, r4 ; hardcoded p1
	ld		%0, r15
	zjmp	%:start_bot

f2:
	st		r14, 6
	live	%0
	fork	%:p4

p3:
	st		r14, 6
	live	%0
	ld		%11, r3
	ld		%191104000, r4 ; sti (0b 64 04 00)
	ld		%0, r15
	zjmp	%:start_bot

p4:
	st		r14, 6
	live	%0
	ld		%15, r3
	ld		%196608, r4 ; sti (00 03 00 00)
	ld		%0, r15
	zjmp	%:start_bot

start_bot:
	st		r14, 6
the_bot:
	live	%0
	sti		r4, %0, r3
#	zjmp	%-50

end:
	