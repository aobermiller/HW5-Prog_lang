%option noyywrap

notchar [^A-Za-z]

%%
"brb"/{notchar}	printf("be right back");
"ttyl"/{notchar}	printf("talk to you later");
"idc"/{notchar}	printf("I don't care");
"idk"/{notchar}	printf("I don't know");
"fwi"/{notchar}	printf("for your information");
"gg"/{notchar}	printf("good game");
"hbu"/{notchar}	printf("how about you?");
"iirc"/{notchar}	printf("if I remember correctly.");
"imo"/{notchar}	printf("in my opinion");
"irl"/{notchar}	printf("in real life");
"jk"/{notchar}	printf("just kidding");
"ok"/{notchar}	printf("okay");
"lol"/{notchar}	printf("laugh out loud");
"lmk"/{notchar}	printf("let me know");
"mb"/{notchar}	printf("maybe");
"nvm"/{notchar}	printf("nevermind");
"np"/{notchar}	printf("no problem");
"omg"/{notchar}	printf("oh my god");
"rly"/{notchar}	printf("really");
"thx"/{notchar}	printf("thanks");
.	ECHO;
%%

int main()
{
	yylex();	
}
