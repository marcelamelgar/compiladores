
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
    String[] keywords = {"class", "while", "int", "if", "else", "break", "boolean", "void", "for", "return", "true", "false", "continue"};
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
        return Tag.IF;
    } else if (keyword.equals("while")) {
        return Tag.WHILE;
    } else if (keyword.equals("int")) {
        return Tag.INT;
    } else if (keyword.equals("class")) {
        return Tag.CLASS;
    } else if (keyword.equals("boolean")) {
        return Tag.BOOLEAN;
    } else if (keyword.equals("void")) {
        return Tag.VOID;
    } else if (keyword.equals("else")) {
        return Tag.ELSE;
    } else if (keyword.equals("for")) {
        return Tag.FOR;
    } else if (keyword.equals("return")) {
        return Tag.RETURN;
    } else if (keyword.equals("true")) {
        return Tag.TRUE;
    } else if (keyword.equals("false")) {
        return Tag.FALSE;
    } else if (keyword.equals("break")) {
        return Tag.BREAK;
    } else if (keyword.equals("continue")) {
        return Tag.CONTINUE;
    } else if (keyword.equals("if")) {
        return Tag.IF;
    }

    return null; //return null for unrecognized keywords
    
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

  [-+]?[0-9]+                  { return new Token(Tag.NUM, Integer.parseInt(yytext())); }
  "([^\"\\]|\\[\"ntbrf\\\\])*" { return new Token(Tag.STRING, yytext()); }

  [a-zA-Z_][a-zA-Z0-9_]* {
    // Check if the matched text is a keyword or a variable
    String lexeme = yytext();
    if (isKeyword(lexeme)) {
        return new Token(getKeywordTokenType(lexeme), lexeme);
    } else {
        return new Token(Tag.ID, lexeme);
    }
}

<YYINITIAL> {

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }


  /* Operadores y delimitadores */
  "+"                            { return new Token(Tag.SUMA, yytext()); }
  "-"                            { return new Token(Tag.RESTA, yytext()); }
  "*"                            { return new Token(Tag.MULTI, yytext()); }
  "/"                            { return new Token(Tag.DIV, yytext()); }
  "%"                            { return new Token(Tag.MOD, yytext()); }
  "="                            { return new Token(Tag.ASIG, yytext()); }
  "=="                           { return new Token(Tag.EQUALS, yytext()); }
  "!="                           { return new Token(Tag.NOTEQUALS, yytext()); }
  "<"                            { return new Token(Tag.LESSTHAN, yytext()); }
  "<="                           { return new Token(Tag.LESSEQUALS, yytext()); }
  ">"                            { return new Token(Tag.MORETHAN, yytext()); }
  ">="                           { return new Token(Tag.MOREEQUALS, yytext()); }
  "&&"                           { return new Token(Tag.AND, yytext()); }
  "||"                           { return new Token(Tag.OR, yytext()); }
  "!"                            { return new Token(Tag.NOT, yytext()); }
  ";"                            { return new Token(Tag.PUNTOCOMA, yytext()); }
  ","                            { return new Token(Tag.COMA, yytext()); }
  "("                            { return new Token(Tag.PIZ, yytext()); }
  ")"                            { return new Token(Tag.PDER, yytext()); }
  "{"                            { return new Token(Tag.LIZ, yytext()); }
  "}"                            { return new Token(Tag.LDER, yytext()); }
  "["                            { return new Token(Tag.CIZ, yytext()); }
  "]"                            { return new Token(Tag.CDER, yytext()); }
  "+="                           { return new Token(Tag.SUMEQUAL, yytext()); }
  "-="                           { return new Token(Tag.MINUSEQUAL, yytext()); }
  "*="                           { return new Token(Tag.MULTEQUAL, yytext()); }
  "/="                           { return new Token(Tag.DIVEQUAL, yytext()); }
  "'" [a-zA-Z0-9] "'"            { return new Token(Tag.CHAR, yytext()); }
  "//"                           { /* ignore */ }


}

/* error fallback */
[^]                              { throw new LexicalException("Illegal character <" +
                                                    yytext() + ">"); }

