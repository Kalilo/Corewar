#This is a test file

.name       "test1"
.comment    "getting closer"

start:
	st		r1, 6
	live	%0
	ld		%49, r3
	ld		%16777216, r4 ; live (01 00 00 00)
	fork	%:start_bot
	st		r1, 6
	live	%0
	ld		%50, r3
	st		r1, r4 ; make my player live
	fork	%:start_bot
	ld		%54, r3
	ld		%192152576, r4 ; sti (0b 74 04 00)
	st		r1, 6
	live	%0
	fork	%:start_bot
	ld		%58, r3
	ld		%199167, r4 ; (00 03 09 ff)
	st		r1, 6
	live	%0
	fork	%:start_bot
	ld		%62, r3
	ld		%3456106496, r4 ; (ce 00 00 00)
	st		r1, 6
	live	%0
	fork	%:the_bot

	ld		%0, r15
	zjmp	%:start

start_bot:
	st		r1, 6
the_bot:
	live	%0
	sti		r4, 0, r3
	zjmp	%-50
	