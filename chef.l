%{
/* chef.x - convert English on stdin to Mock Swedish on stdout
 *
 * The WC definition matches any word character, and the NW definition matches
 * any non-word character.  Two start conditions are maintained: INW (in word)
 * and NIW (not in word).  The first rule passes TeX commands without change.
 *
 * HISTORY
 *
 * Apr 26, 1993; John Hagerman: Added ! and ? to the Bork Bork Bork rule.
 *
 * Apr 15, 1992; John Hagerman: Created.
 */

static int i_seen = 0; //C variable to track the number of i's seen
%}

WC		[A-Za-z'] //Anything thats an alphabetical character or '
NW		[^A-Za-z'] //Everything that isn't an alphabetical character or '

%start		INW NIW

%%

\\[^ \n]+	ECHO; //No changes when there's only a new line

{NW}		{ BEGIN NIW; i_seen = 0; ECHO; }
[.!?]$		{ BEGIN NIW; i_seen = 0;
		  printf("%c\nBork Bork Bork!",yytext[0]); }//replaces-any-punctuationwith-"Bork Bork Bork!"

<NIW>"bork"/{NW} ECHO; //Prints any borks found
<NIW>"Bork"/{NW} ECHO; //Prints any Borks found

"an"		{ BEGIN INW; printf("un"); } //replaces-an-with-un
"An"		{ BEGIN INW; printf("Un"); } //replaces-An-with-Un
"au"		{ BEGIN INW; printf("oo"); } //replaces-au-with-oo
"Au"		{ BEGIN INW; printf("Oo"); } //replaces-Au-with-Oo
"a"/{WC}	{ BEGIN INW; printf("e"); } //repleaces-a-with-e-only-if-its-followed-by-a-WC
"A"/{WC}	{ BEGIN INW; printf("E"); } //repleaces-A-with-E-only-if-its-followed-by-a-WC
"en"/{NW}	{ BEGIN INW; printf("ee"); } //repleace-en-with-ee-only-if-its-followed-by-a-NW
<INW>"ew"	{ BEGIN INW; printf("oo"); } //replaces-ew-with-oo
<INW>"e"/{NW}	{ BEGIN INW; printf("e-a"); } //replaces-e-with-e-a-if-its-followed-by-a-NW
<NIW>"e"	{ BEGIN INW; printf("i"); } //replaces-e-with-i
<NIW>"E"	{ BEGIN INW; printf("I"); } //replaces-E-with-I
<INW>"f"	{ BEGIN INW; printf("ff"); } //replaces-f-with-ff
<INW>"ir"	{ BEGIN INW; printf("ur"); } //replaces-ir-with-ur
<INW>"i"	{ BEGIN INW; printf(i_seen++ ? "i" : "ee"); } //increments-i_seen-and-prints-ee
<INW>"ow"	{ BEGIN INW; printf("oo"); } //replaces-ow-with-oo
<NIW>"o"	{ BEGIN INW; printf("oo"); } //replaces-o-with-oo
<NIW>"O"	{ BEGIN INW; printf("Oo"); } //replaces-O-with-Oo
<INW>"o"	{ BEGIN INW; printf("u"); } //replaces-o-with-u
"the"		{ BEGIN INW; printf("zee"); } //replaces-the-with-zee
"The"		{ BEGIN INW; printf("Zee"); } //replaces-The-with-Zee
"th"/{NW}	{ BEGIN INW; printf("t"); } //replaces-th-with-t-only-if-followed-by-NW
<INW>"tion"	{ BEGIN INW; printf("shun"); } //replaces-tion-with-shun
<INW>"u"	{ BEGIN INW; printf("oo"); } //replaces-u-with-oo
<INW>"U"	{ BEGIN INW; printf("Oo"); } //replaces-U-with-Oo
"v"		{ BEGIN INW; printf("f"); } //replaces-v-with-f
"V"		{ BEGIN INW; printf("F"); } //replaces-V-with-F
"w"		{ BEGIN INW; printf("v"); } //replaces-w-with-v
"W"		{ BEGIN INW; printf("V"); } //replaces-W-with-V

.		{ BEGIN INW; ECHO; } //echoes-everything-else
