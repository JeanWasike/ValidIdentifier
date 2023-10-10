%{
#include <stdio.h>
#include <string.h>

int isKeyword(char* text) {
    char* keywords[] = {"False","await","else","import","pass","None","break","except","in","raise","True","class","finally","is",
                        "return","and","continue","for","lambda","try","as","def","from","nonlocal","while","assert","del","global",
                        "not","with","async","elif","if","or","yield"};
    int numKeywords = sizeof(keywords) / sizeof(keywords[0]);

    for (int i = 0; i < numKeywords; i++) {
        if (strcmp(text, keywords[i]) == 0) {
            return 1; // It's a keyword
        }
    }

    return 0; // It's not a keyword
}

int count =0;
%}

%option noyywrap

%option nodefault


%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (isKeyword(yytext)) {
        count ++;
    } 
}

^[^a-zA-Z_][a-zA-Z0-9_]* {count++;}

.     {count++;}
\n    {return 0;}
%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <identifier_or_keyword>\n", argv[0]);
        return 1;
    }

    yy_scan_string(argv[1]);
    yylex();
    if(count>0){
	printf("Invalid Identifier");
    }
    else{
        printf("Valid Identifier");
    }
    return 0;
}
