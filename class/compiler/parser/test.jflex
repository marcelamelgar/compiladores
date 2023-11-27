%%

%class GeneratedLexer
%type java_cup.runtime.Symbol
%unicode
%line
%column
%cup

%{
    // Row and Column tracking if needed
    int currentRow = 1;
    int currentCol = 1;

    private boolean isKeyword(String text) {
    String[] keywords = {"class", "int", "if", "else", "break", "boolean", "void", "for", "return", "true", "false", "continue","callout"};
    for (String keyword : keywords) {
        if (keyword.equals(text)) {
            return true;
        }
    }
    return false;
    }

    private int getKeywordTokenType(String keyword) {
    switch (keyword) {
        case "if":
            return Sym.If;
        case "int":
            return Sym.Int;
        case "class":
            return Sym.Class;
        case "boolean":
            return Sym.Boolean;
        case "void":
            return Sym.Void;
        case "else":
            return Sym.Else;
        case "for":
            return Sym.For;
        case "return":
            return Sym.Return;
        case "true":
            return Sym.True;
        case "false":
            return Sym.False;
        case "break":
            return Sym.Break;
        case "continue":
            return Sym.Continue;
        case "callout":
            return Sym.Callout;
        default:
            return 0; // Return 0 or an appropriate error code for unrecognized keywords
        }
    }

%}

/* Regular Expressions */
WhiteSpace = [ \t\f\r\n]+
Identifier = [a-zA-Z_][a-zA-Z_0-9]*
Number = [0-9]+
HexNumber = 0x[0-9a-fA-F]+
StringLiteral = \"[^\"]*\" // anything except unescaped quotes
CharLiteral = \'(\\.|[^'\\])\'    // anything except unescaped single quotes

/* Keywords */
Keyword = "class" | "int" | "if" | "else" | "break" | "boolean" | "void" | "for" | "return" | "true" | "false" | "continue" | "callout"

%%

/* Rules */
{WhiteSpace}        { /* Ignore white space */ }
{Keyword} {
    switch (yytext()) {
        case "class":
            return new java_cup.runtime.Symbol(Sym.Class, yyline, yycolumn);
        case "int":
            return new java_cup.runtime.Symbol(Sym.Int, yyline, yycolumn);
        case "if":
            return new java_cup.runtime.Symbol(Sym.If, yyline, yycolumn);
        case "else":
            return new java_cup.runtime.Symbol(Sym.Else, yyline, yycolumn);
        case "break":
            return new java_cup.runtime.Symbol(Sym.Break, yyline, yycolumn);
        case "boolean":
            return new java_cup.runtime.Symbol(Sym.Boolean, yyline, yycolumn);
        case "for":
            return new java_cup.runtime.Symbol(Sym.For, yyline, yycolumn);
        case "return":
            return new java_cup.runtime.Symbol(Sym.Return, yyline, yycolumn);
        case "true":
            return new java_cup.runtime.Symbol(Sym.True, yyline, yycolumn);
        case "false":
            return new java_cup.runtime.Symbol(Sym.False, yyline, yycolumn);
        case "continue":
            return new java_cup.runtime.Symbol(Sym.Continue, yyline, yycolumn);
        case "callout":
            return new java_cup.runtime.Symbol(Sym.Callout, yyline, yycolumn);
        default:
            throw new IllegalArgumentException("Unknown keyword: " + yytext());
    }
}

{Identifier}        { return new java_cup.runtime.Symbol(Sym.Id, yyline, yycolumn, yytext()); }
{Number}            { return new java_cup.runtime.Symbol(Sym.DecimalLiteral, yyline, yycolumn, yytext()); }
{HexNumber}         { return new java_cup.runtime.Symbol(Sym.HexLiteral, yyline, yycolumn, yytext()); }
{StringLiteral}     { return new java_cup.runtime.Symbol(Sym.StringLiteral, yyline, yycolumn, yytext()); }
{CharLiteral}       { return new java_cup.runtime.Symbol(Sym.CharLiteral, yyline, yycolumn, yytext()); }

/* Operators and Delimiters */
"{"                { return new java_cup.runtime.Symbol(Sym.LeftKey, yyline, yycolumn, yytext()); }
"}"                { return new java_cup.runtime.Symbol(Sym.RightKey, yyline, yycolumn, yytext()); }
"("                { return new java_cup.runtime.Symbol(Sym.LeftParent, yyline, yycolumn, yytext()); }
")"                { return new java_cup.runtime.Symbol(Sym.RightParent, yyline, yycolumn, yytext()); }
"["                { return new java_cup.runtime.Symbol(Sym.LeftBracket, yyline, yycolumn, yytext()); }
"]"                { return new java_cup.runtime.Symbol(Sym.RightBracket, yyline, yycolumn, yytext()); }
","                { return new java_cup.runtime.Symbol(Sym.Comma, yyline, yycolumn, yytext()); }
";"                { return new java_cup.runtime.Symbol(Sym.SemiColom, yyline, yycolumn, yytext()); }
"+"                { return new java_cup.runtime.Symbol(Sym.Add, yyline, yycolumn, yytext()); }
"-"                { return new java_cup.runtime.Symbol(Sym.Substract, yyline, yycolumn, yytext()); }
"*"                { return new java_cup.runtime.Symbol(Sym.Multiplication, yyline, yycolumn, yytext()); }
"/"                { return new java_cup.runtime.Symbol(Sym.Division, yyline, yycolumn, yytext()); }
"="                { return new java_cup.runtime.Symbol(Sym.Asign, yyline, yycolumn, yytext()); }
"=="               { return new java_cup.runtime.Symbol(Sym.Equal, yyline, yycolumn, yytext()); }
"!="               { return new java_cup.runtime.Symbol(Sym.NotEqual, yyline, yycolumn, yytext()); }
"<"                { return new java_cup.runtime.Symbol(Sym.LessThan, yyline, yycolumn, yytext()); }
">"                { return new java_cup.runtime.Symbol(Sym.GreaterThan, yyline, yycolumn, yytext()); }
"<="               { return new java_cup.runtime.Symbol(Sym.LessEqualThan, yyline, yycolumn, yytext()); }
">="               { return new java_cup.runtime.Symbol(Sym.GreaterEqualThan, yyline, yycolumn, yytext()); }
"&&"               { return new java_cup.runtime.Symbol(Sym.And, yyline, yycolumn, yytext()); }
"||"               { return new java_cup.runtime.Symbol(Sym.Or, yyline, yycolumn, yytext()); }
"!"                { return new java_cup.runtime.Symbol(Sym.Exclam, yyline, yycolumn, yytext()); }

/* EOF Rule */
<<EOF>> {
    return new java_cup.runtime.Symbol(Sym.EOF);
}

/* Error Handling */
. { throw new IllegalArgumentException("Illegal character <" + yytext() + ">"); }
