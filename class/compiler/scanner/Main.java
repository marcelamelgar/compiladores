import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) throws IOException {
        //GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new InputStreamReader(System.in)));
        GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new FileReader("prueba.txt")));
        // BufferedReader reader = new BufferedReader(new FileReader("prueba.txt"));
        // GeneratedLexer lexer = new GeneratedLexer(reader);
        Token token;
        LinkedList <Token> TokenList = new LinkedList<>();
        LinkedList <Token> ErrorList = new LinkedList<>();
        try{
            while ((token = lexer.yylex()) != null) {
                if (token.tag == 48) {
                    ErrorMessg erroMs = new ErrorMessg(token.tag, token.row, token.col, token.value);
                    System.out.println(erroMs.DisplayError());
                    ErrorList.add(token);
                }
                else {
                    System.out.println("Token: " + token.tag + " Value: " + token.value + "\nRow: " + token.row + " Column: " + token.col);
                    TokenList.add(token);
                }
                //System.out.println("Token: " + token.tag + " Value: " + token.value + "\nRow: " + token.row + " Column: " + token.col);
            } 
        } catch (LexicalException lexEx){
            System.out.println(lexEx);
        }

        for (Token item : TokenList) {
            System.out.println(item.displayToken());
        }

        for (Token item : ErrorList) {
            System.out.println(item.displayErrors());
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
