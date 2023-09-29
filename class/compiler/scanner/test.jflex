
%%

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
private boolean isKeyword(String text) {
    String[] keywords = {"class", "while", "int", "if", "else", "break", "boolean", "void", "for", "return", "true", "false", "continue","callout"};
    for (String keyword : keywords) {
        if (keyword.equals(text)) {
            return true;
        }
    }
    return false;
}

private int getKeywordTokenType(String keyword) {
    // Define mappings from keywords to token types here
    if (keyword.equals("if")) {
        return Token.IF;
    } else if (keyword.equals("while")) {
        return Token.WHILE;
    } else if (keyword.equals("int")) {
        return Token.INT;
    } else if (keyword.equals("class")) {
        return Token.CLASS;
    } else if (keyword.equals("boolean")) {
        return Token.BOOLEAN;
    } else if (keyword.equals("void")) {
        return Token.VOID;
    } else if (keyword.equals("else")) {
        return Token.ELSE;
    } else if (keyword.equals("for")) {
        return Token.FOR;
    } else if (keyword.equals("return")) {
        return Token.RETURN;
    } else if (keyword.equals("true")) {
        return Token.TRUE;
    } else if (keyword.equals("false")) {
        return Token.FALSE;
    } else if (keyword.equals("break")) {
        return Token.BREAK;
    } else if (keyword.equals("continue")) {
        return Token.CONTINUE;
    } else if (keyword.equals("if")) {
        return Token.IF;
    } else if (keyword.equals("callout")) {
        return Token.CALLOUT;
    }    

    return 0; //return null for unrecognized keywords
    
}
%}

/* Here we define some macros, which are abbriviations for regular expressions.
 */

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

/* NOT VALID ASSIGNEMNT IDENTIFIERS!!!! CHANGE ME!!!! */
Identifier = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = [0-9]


%%

/* Now we define keywords in our grammer
 * When the input string matches the regex on the left the action on the right
 * is performed. The action is java code. The regex matches longest match by
 * default. The lexer starts in the <YYINITIAL> state.
 */

  [-+]?[0-9]+                  { return new Token(Token.NUM, Integer.parseInt(yytext())); }
  0x[0-9a-fA-F]+               { return new Token(Token.HEXA, yytext()); }
  [a-zA-Z]                     { return new Token(Token.CHAR, yytext()); }
  \"[^\"]*\"                   { return new Token(Token.STRING, yytext()); }

  [a-zA-Z_][a-zA-Z0-9_]* {
    // Check if the matched text is a keyword or a variable
    String lexeme = yytext();
    if (isKeyword(lexeme)) {
        return new Token(getKeywordTokenType(lexeme), lexeme);
    } else {
        return new Token(Token.ID, lexeme);
    }
}

<YYINITIAL> {

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }


  /* Operadores y delimitadores */
  "+"                            { return new Token(Token.SUMA, yytext()); }
  "-"                            { return new Token(Token.RESTA, yytext()); }
  "*"                            { return new Token(Token.MULTI, yytext()); }
  "/"                            { return new Token(Token.DIV, yytext()); }
  "%"                            { return new Token(Token.MOD, yytext()); }
  "="                            { return new Token(Token.ASIG, yytext()); }
  "=="                           { return new Token(Token.EQUALS, yytext()); }
  "!="                           { return new Token(Token.NOTEQUALS, yytext()); }
  "<"                            { return new Token(Token.LESSTHAN, yytext()); }
  "<="                           { return new Token(Token.LESSEQUALS, yytext()); }
  ">"                            { return new Token(Token.MORETHAN, yytext()); }
  ">="                           { return new Token(Token.MOREEQUALS, yytext()); }
  "&&"                           { return new Token(Token.AND, yytext()); }
  "||"                           { return new Token(Token.OR, yytext()); }
  "!"                            { return new Token(Token.NOT, yytext()); }
  ";"                            { return new Token(Token.PUNTOCOMA, yytext()); }
  ","                            { return new Token(Token.COMA, yytext()); }
  "("                            { return new Token(Token.PIZ, yytext()); }
  ")"                            { return new Token(Token.PDER, yytext()); }
  "{"                            { return new Token(Token.LIZ, yytext()); }
  "}"                            { return new Token(Token.LDER, yytext()); }
  "["                            { return new Token(Token.CIZ, yytext()); }
  "]"                            { return new Token(Token.CDER, yytext()); }
  "+="                           { return new Token(Token.SUMEQUAL, yytext()); }
  "-="                           { return new Token(Token.MINUSEQUAL, yytext()); }
  "*="                           { return new Token(Token.MULTEQUAL, yytext()); }
  "/="                           { return new Token(Token.DIVEQUAL, yytext()); }
  "//"(.)*\n?                    { return new Token(Token.SCOMMENT, yytext()); }


}

/* error fallback */
[^]                              { throw new LexicalException("Illegal character <" +
                                                    yytext() + ">"); }

