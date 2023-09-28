package compiler.scanner;

import java.io.*;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new InputStreamReader(System.in)));
        Token token;

        while ((token = lexer.yylex()) != null) {
            System.out.println("Token: " + token.tag + " Value: " + token.value);
        }
    }
}

// class Token {
//     int tag;
//     Object value;

//     Token(int t, Object v) {
//         tag = t;
//         value = v;
//     }
// }


// class Tag {
//     static final int ID = 256;
//     static final int NUM = 257;

// }
