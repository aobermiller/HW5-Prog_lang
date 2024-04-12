%option noyywrap

notchar [^A-Za-z]
punct [^A-Za-z,\s]
%s SENT ELSE
%%

{punct} {BEGIN SENT; ECHO;}

<ELSE>"brb"/{notchar}		printf("be right back");
<ELSE>"ttyl"/{notchar}	printf("talk to you later");
"idc"/{notchar}		printf("I don't care");
"idk"/{notchar}		printf("I don't know");
<ELSE>"fwi"/{notchar}		printf("for your information");
<ELSE>"gg"/{notchar}		printf("good game");
<ELSE>"hbu"/{notchar}		printf("how about you?");
<ELSE>"iirc"/{notchar}	printf("if I remember correctly.");
<ELSE>"imo"/{notchar}		printf("in my opinion");
<ELSE>"irl"/{notchar}		printf("in real life");
<ELSE>"jk"/{notchar}		printf("just kidding");
<ELSE>"kk"/{notchar}		printf("okay");
<ELSE>"lol"/{notchar}		printf("laugh out loud");
<ELSE>"lmk"/{notchar}		printf("let me know");
<ELSE>"mb"/{notchar}		printf("maybe");
<ELSE>"nvm"/{notchar}		printf("nevermind");
<ELSE>"np"/{notchar}		printf("no problem");
<ELSE>"omg"/{notchar}		printf("oh my god");
<ELSE>"rly"/{notchar}		printf("really");
<ELSE>"thx"/{notchar}		printf("thanks");

<SENT>"brb"/{notchar}	{BEGIN INITIAL; printf("Be right back");}
<SENT>"ttyl"/{notchar}	{BEGIN INITIAL; printf("Talk to you later");}
<SENT>"fwi"/{notchar}	{BEGIN INITIAL; printf("For your information");}
<SENT>"gg"/{notchar}	{BEGIN INITIAL; printf("Good game");}
<SENT>"hbu"/{notchar}   {BEGIN INITIAL; printf("How about you?");}
<SENT>"iirc"/{notchar}  {BEGIN INITIAL; printf("If I remember correctly.");}
<SENT>"imo"/{notchar}   {BEGIN INITIAL; printf("In my opinion");}
<SENT>"irl"/{notchar}   {BEGIN INITIAL; printf("In real life");}
<SENT>"jk"/{notchar}    {BEGIN INITIAL; printf("Just kidding");}
<SENT>"kk"/{notchar}    {BEGIN INITIAL; printf("Okay");}
<SENT>"lol"/{notchar}   {BEGIN INITIAL; printf("Laugh out loud");}
<SENT>"lmk"/{notchar}   {BEGIN INITIAL; printf("Let me know");}
<SENT>"mb"/{notchar}    {BEGIN INITIAL; printf("Maybe");}
<SENT>"np"/{notchar}    {BEGIN INITIAL; printf("No problem");}
<SENT>"omg"/{notchar}   {BEGIN INITIAL; printf("Oh my god");}
<SENT>"rly"/{notchar}   {BEGIN INITIAL; printf("Really");}
<SENT>"thx"/{notchar}   {BEGIN INITIAL; printf("Thanks");}
<SENT>"nvm"/{notchar}   {BEGIN INITIAL; printf("Nevermind");}

.	{BEGIN ELSE; ECHO;}
%%

int main()
{
	yylex();	
}
