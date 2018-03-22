%{
    int line_count = 1, character_count = 0, word_count = 0;
    int word_flag=1;
%}
 
%%
\n      {character_count++; line_count++; word_flag=1;}
([a-z]|[A-Z]|[0-9])      {character_count++; if(word_flag){word_count++;word_flag=0;}}
.       {character_count++; word_flag=1;}
 
%%
int main() {
    yylex();
    printf("character_count: %d\n", character_count);
    printf("word_count: %d\n", word_count);
    printf("line_count: %d\n", line_count);
}