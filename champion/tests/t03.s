#This is a test file

.name       "test1"
.comment    "testing features"


save_live_command:
	ld		%16777216, r2 ;live
	ld		%57671680, r3 ; ld and encoding byte (0370)
	ld		%33554432, r4
	ld		%16790019, r5
	ld		%1879179308, r6
	ld		%100728832, r7

test:
	live	%1
	st		r1, 50
	st		r2, 44
	st		r3, 44
	st		r5	41
	st		r6, 40
	st		r7, 39