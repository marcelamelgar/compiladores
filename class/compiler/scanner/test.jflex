/* The consists of three parts, seperated by the %% delimiter.
 * Text up to the first %% is copied verbatim into the created source file.
 * Used for package and import statements. (we don't need any here)
 */
%%

/* The next section is for options and macros. Things defined here can be used
 * in the next rules section.
 */

/* The class will be called GeneratedLexer */
%class GeneratedLexer

/* The yylex() method will return an instance of Token */
%type Token

/* The yylex() method will throw a LexicalException */
%scanerror LexicalException

%unicode

/* Code in the next section is copied into the generated lexer class.
 */
%{
%}

/* Here we define some macros, which are abbriviations for regular expressions.
 */

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

/* NOT VALID ASSIGNEMNT IDENTIFIERS!!!! CHANGE ME!!!! */
Identifier = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = [0-9]

%state STRING

%%

/* Now we define keywords in our grammer
 * When the input string matches the regex on the left the action on the right
 * is performed. The action is java code. The regex matches longest match by
 * default. The lexer starts in the <YYINITIAL> state.
 */


  /* Palabras clave */
  <YYINITIAL> "class"                        { return new Token(Token.CLASS, yytext()); }
  <YYINITIAL> "if"                           { return new Token(Token.IF, yytext()); }
  <YYINITIAL> "else"                         { return new Token(Token.ELSE, yytext()); }
  <YYINITIAL> "while"                        { return new Token(Token.WHILE, yytext()); }
  <YYINITIAL> "return"                       { return new Token(Token.RETURN, yytext()); }
  <YYINITIAL> "boolean"                      { return new Token(Token.BOOLEAN, yytext()); }
  <YYINITIAL> "int"                          { return new Token(Token.INT, yytext()); }
  <YYINITIAL> "char"                         { return new Token(Token.CHAR, yytext()); }
  <YYINITIAL> "void"                         { return new Token(Token.VOID, yytext()); }
  <YYINITIAL> "break"                        { return symbol(sym.BREAK); }


<YYINITIAL> {
  /* identifiers */
  {Identifier}                   { return new Token(1,yytext()); }
  /* use a macro to match integers */
  {DecIntegerLiteral}            { return new Token(2,Integer.parseInt(yytext())); }


  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }


  /* Operadores y delimitadores */
  "+"                            { return new Token(Token.PLUS, yytext()); }
  "-"                            { return new Token(Token.MINUS, yytext()); }
  "*"                            { return new Token(Token.MULTIPLY, yytext()); }
  "/"                            { return new Token(Token.DIVIDE, yytext()); }
  "%"                            { return new Token(Token.MODULO, yytext()); }
  "="                            { return new Token(Token.ASSIGN, yytext()); }
  "=="                           { return new Token(Token.EQUALS, yytext()); }
  "!="                           { return new Token(Token.NOT_EQUALS, yytext()); }
  "<"                            { return new Token(Token.LESS_THAN, yytext()); }
  "<="                           { return new Token(Token.LESS_THAN_OR_EQUAL, yytext()); }
  ">"                            { return new Token(Token.GREATER_THAN, yytext()); }
  ">="                           { return new Token(Token.GREATER_THAN_OR_EQUAL, yytext()); }
  "&&"                           { return new Token(Token.LOGICAL_AND, yytext()); }
  "||"                           { return new Token(Token.LOGICAL_OR, yytext()); }
  "!"                            { return new Token(Token.LOGICAL_NOT, yytext()); }
  ";"                            { return new Token(Token.SEMICOLON, yytext()); }
  ","                            { return new Token(Token.COMMA, yytext()); }
  "("                            { return new Token(Token.LEFT_PAREN, yytext()); }
  ")"                            { return new Token(Token.RIGHT_PAREN, yytext()); }
  "{"                            { return new Token(Token.LEFT_BRACE, yytext()); }
  "}"                            { return new Token(Token.RIGHT_BRACE, yytext()); }
  "["                            { return new Token(Token.LEFT_BRACKET, yytext()); }
  "]"                            { return new Token(Token.RIGHT_BRACKET, yytext()); }
}

/* error fallback */
[^]                              { throw new LexicalException("Illegal character <" +
                                                    yytext() + ">"); }
