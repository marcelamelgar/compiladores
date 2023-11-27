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

%}

/* Regular Expressions */
WhiteSpace = [ \t\f\r\n]+
Identifier = [a-zA-Z_][a-zA-Z_0-9]*
Number = [0-9]+
HexNumber = 0x[0-9a-fA-F]+
StringLiteral = \"[^\"]*\" // anything except unescaped quotes
CharLiteral = \'(\\.|[^'\\])\'    // anything except unescaped single quotes

%%
/* Keywords */
"class" { return new java_cup.runtime.Symbol(Sym.Class, yyline, yycolumn, yytext()); }
"int" { return new java_cup.runtime.Symbol(Sym.Int, yyline, yycolumn, yytext()); }
"if" { return new java_cup.runtime.Symbol(Sym.If, yyline, yycolumn, yytext()); }
"else" { return new java_cup.runtime.Symbol(Sym.Else, yyline, yycolumn, yytext()); }
"break" { return new java_cup.runtime.Symbol(Sym.Break, yyline, yycolumn, yytext()); }
"boolean" { return new java_cup.runtime.Symbol(Sym.Boolean, yyline, yycolumn, yytext()); }
"void" { return new java_cup.runtime.Symbol(Sym.Void, yyline, yycolumn, yytext()); }
"for" { return new java_cup.runtime.Symbol(Sym.For, yyline, yycolumn, yytext()); }
"return" { return new java_cup.runtime.Symbol(Sym.Return, yyline, yycolumn, yytext()); }
"true" { return new java_cup.runtime.Symbol(Sym.True, yyline, yycolumn, yytext()); }
"false" { return new java_cup.runtime.Symbol(Sym.False, yyline, yycolumn, yytext()); }
"continue" { return new java_cup.runtime.Symbol(Sym.Continue, yyline, yycolumn, yytext()); }
"callout" { return new java_cup.runtime.Symbol(Sym.Callout, yyline, yycolumn, yytext()); }
"Main" { return new java_cup.runtime.Symbol(Sym.Program, yyline, yycolumn, yytext()); }
{Identifier} { return new java_cup.runtime.Symbol(Sym.Id, yyline, yycolumn, yytext()); }
{Number} { return new java_cup.runtime.Symbol(Sym.DecimalLiteral, yyline, yycolumn, yytext()); }
{HexNumber} { return new java_cup.runtime.Symbol(Sym.HexLiteral, yyline, yycolumn, yytext()); }
{StringLiteral} { return new java_cup.runtime.Symbol(Sym.StringLiteral, yyline, yycolumn, yytext()); }
{CharLiteral} { return new java_cup.runtime.Symbol(Sym.CharLiteral, yyline, yycolumn, yytext()); }
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
"."                { return new java_cup.runtime.Symbol(Sym.Dot, yyline, yycolumn, yytext()); }

{WhiteSpace}        { /* Ignore white space */ }

/* EOF Rule */
<<EOF>> {
    return new java_cup.runtime.Symbol(Sym.EOF);
}

/* Error Handling */
. { throw new IllegalArgumentException("Illegal character <" + yytext() + ">"); }
