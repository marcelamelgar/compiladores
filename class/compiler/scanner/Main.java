import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;

public class Main {
    public static void main(String[] args) throws IOException {
        GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new InputStreamReader(System.in)));
        System.out.println("Ingrese un texto para verificar su lexico:");
        Token token;
        try{
            while ((token = lexer.yylex()) != null) {
                System.out.println("Token: " + token.tag + " Value: " + token.value);
            } 
        } catch (LexicalException lexEx){
            System.out.println("Lexical Exception detected");
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
