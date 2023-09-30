
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
  \n {
    currentRow++;
    currentCol = 1;
  }
  [-+]?[0-9]+                   { 
                                    currentCol++;
                                    return new Token(Token.NUM, currentRow, currentCol, Integer.parseInt(yytext())); 
                                }
  0x[0-9a-fA-F]+                { 
                                    currentCol++;
                                    return new Token(Token.HEXA, currentRow, currentCol, yytext()); 
                                }
  [a-zA-Z]                      { 
                                    currentCol++;
                                    return new Token(Token.CHAR, currentRow, currentCol, yytext()); 
                                }
  \"[^\"]*\"                    {
                                    currentCol++;  
                                    return new Token(Token.STRING, currentRow, currentCol, yytext()); 
                                }
  [0-9][a-zA-Z0-9_]*            {
                                    currentCol++;  
                                    return new Token(Token.ERROR, currentRow, currentCol, yytext());
                                }

  [a-zA-Z_][a-zA-Z0-9_]* {
    // Check if the matched text is a keyword or a variable
    String lexeme = yytext();
    if (isKeyword(lexeme)) {
        currentCol++;  
        return new Token(getKeywordTokenType(lexeme), currentRow, currentCol,lexeme);
    } else {
        currentCol++;  
        return new Token(Token.ID, currentRow, currentCol,lexeme);
    }
}

<YYINITIAL> {

  /* whitespace */
  {WhiteSpace}                   { currentCol++; }


  /* Operadores y delimitadores */
  "+"                           { 
                                    currentCol++;   
                                    return new Token(Token.SUMA, currentRow, currentCol, yytext()); 
                                }
  "-"                           { 
                                    currentCol++;   
                                    return new Token(Token.RESTA, currentRow, currentCol, yytext()); 
                                }
  "*"                           { 
                                    currentCol++;   
                                    return new Token(Token.MULTI, currentRow, currentCol, yytext()); 
                                }
  "/"                           { 
                                    currentCol++;
                                    return new Token(Token.DIV, currentRow, currentCol, yytext()); 
                                }
  "%"                           { 
                                    currentCol++;
                                    return new Token(Token.MOD, currentRow, currentCol, yytext()); 
                                }
  "="                           { 
                                    currentCol++;
                                    return new Token(Token.ASIG, currentRow, currentCol, yytext()); 
                                }
  "=="                          { 
                                    currentCol++;
                                    return new Token(Token.EQUALS, currentRow, currentCol, yytext()); 
                                }
  "!="                          { 
                                    currentCol++;
                                    return new Token(Token.NOTEQUALS, currentRow, currentCol, yytext()); 
                                }
  "<"                           { 
                                    currentCol++;
                                    return new Token(Token.LESSTHAN, currentRow, currentCol, yytext()); 
                                }
  "<="                          { 
                                    currentCol++;
                                    return new Token(Token.LESSEQUALS, currentRow, currentCol, yytext()); 
                                }
  ">"                           { 
                                    currentCol++;
                                    return new Token(Token.MORETHAN, currentRow, currentCol, yytext()); 
                                }
  ">="                          {
                                    currentCol++; 
                                    return new Token(Token.MOREEQUALS, currentRow, currentCol, yytext()); 
                                }
  "&&"                          { 
                                    currentCol++;
                                    return new Token(Token.AND, currentRow, currentCol, yytext()); 
                                }
  "||"                          { 
                                    currentCol++;
                                    return new Token(Token.OR, currentRow, currentCol, yytext()); 
                                }
  "!"                           { 
                                    currentCol++;
                                    return new Token(Token.NOT, currentRow, currentCol, yytext()); 
                                }
  ";"                           { 
                                    currentCol++;
                                    return new Token(Token.PUNTOCOMA, currentRow, currentCol, yytext()); 
                                }
  ","                           { 
                                    currentCol++;
                                    return new Token(Token.COMA, currentRow, currentCol, yytext()); 
                                }
  "("                           { 
                                    currentCol++;
                                    return new Token(Token.PIZ, currentRow, currentCol, yytext()); 
                                }
  ")"                           { 
                                    currentCol++;
                                    return new Token(Token.PDER, currentRow, currentCol, yytext()); 
                                }
  "{"                           { 

                                    return new Token(Token.LIZ, currentRow, currentCol, yytext()); 
                                }
  "}"                           { 
                                    currentCol++;
                                    return new Token(Token.LDER, currentRow, currentCol, yytext()); 
                                }
  "["                           { 
                                    currentCol++;
                                    return new Token(Token.CIZ, currentRow, currentCol, yytext()); 
                                }
  "]"                           {
                                    currentCol++;
                                    return new Token(Token.CDER, currentRow, currentCol, yytext()); 
                                }
  "+="                          { 
                                    currentCol++;
                                    return new Token(Token.SUMEQUAL, currentRow, currentCol, yytext()); 
                                }
  "-="                          { 
                                    currentCol++;
                                    return new Token(Token.MINUSEQUAL, currentRow, currentCol, yytext()); 
                                }
  "*="                          { 
                                    currentCol++;
                                    return new Token(Token.MULTEQUAL, currentRow, currentCol, yytext()); 
                                }
  "/="                          { 
                                    currentCol++;
                                    return new Token(Token.DIVEQUAL, currentRow, currentCol, yytext()); 
                                }
  "//"(.)*\n?                   { 
                                    currentCol++;
                                    return new Token(Token.SCOMMENT, currentRow, currentCol, yytext()); 
                                }


}

/* error fallback */
[^]                             { 
                                    currentCol++;
                                    return new Token(Token.ERROR, currentRow, currentCol, yytext()); 
                                }

