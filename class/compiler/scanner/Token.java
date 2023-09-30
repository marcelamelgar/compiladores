class Token {

    static final int ID = 1;
    static final int NUM = 2;
    static final int CLASS = 3;
    static final int INT = 4;
    static final int BOOLEAN = 5;
    static final int VOID = 6;
    static final int IF = 7;
    static final int ELSE = 8;
    static final int WHILE = 9;
    static final int FOR = 10;
    static final int RETURN = 11;
    static final int TRUE = 12;
    static final int FALSE = 13;
    static final int BREAK = 14;
    static final int CONTINUE = 15;
    static final int SUMA = 16;
    static final int RESTA = 17;
    static final int MULTI = 18;
    static final int DIV = 19;
    static final int MOD = 20;
    static final int ASIG = 21;
    static final int EQUALS = 22;
    static final int NOTEQUALS = 23;
    static final int LESSTHAN = 24;
    static final int MORETHAN = 25;
    static final int LESSEQUALS = 26;
    static final int MOREEQUALS = 27;
    static final int AND = 28;
    static final int OR = 29;
    static final int NOT = 30;
    static final int PIZ = 31;
    static final int PDER = 32;
    static final int CIZ = 33;
    static final int CDER = 34;
    static final int LIZ = 35;
    static final int LDER = 36;
    static final int PUNTOCOMA = 37;
    static final int COMA = 38;
    static final int SCOMMENT = 39;
    static final int STRING = 40;
    static final int CHAR = 41;
    static final int SUMEQUAL = 42;
    static final int MINUSEQUAL = 43;
    static final int MULTEQUAL = 44;
    static final int DIVEQUAL = 45;
    static final int CALLOUT = 46;
    static final int HEXA = 47;
    static final int ERROR = 48;

    int tag;
    int row;
    int col;
    Object value;

    Token(int t, int row, int col, Object v) {
        this.tag = t;
        this.row = row;
        this.col = col;
        this.value = v;
    }

    public String displayToken(){
        return "\nToken TAG: " + this.tag + "\nValue: "+ this.value + "\nFound in line " + this.row + " column " + this.col + "\n";
    }

    public String displayErrors(){
         return "\nValue: "+ this.value + "\nError found in line " + this.row + " column " + this.col + "\n";
    }

}

class ErrorMessg extends Token {
    ErrorMessg(int t, int row, int col, Object v) {
        super(t, row, col, v);
    }

    public String DisplayError(){
        return "Syntax error in line " + this.row + " column " + this.col + "\n     Unexpected value: " + this.value;
    }
}
