package compiler.scanner;

public class Token {
    int tag;
    Object value;

    Token(int t, Object v) {
        tag = t;
        value = v;
    }


}
