import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

public class Scanner {
    String fileName;
    LinkedList <Token> TokenList = new LinkedList<>();
    LinkedList <Token> ErrorList = new LinkedList<>();

    Scanner(String fileName){
        this.fileName = fileName;
    }

    public void TokenScanner()  throws IOException {
        GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new FileReader(this.fileName)));
        Token token;
        try{
            while ((token = lexer.yylex()) != null) {
                if (token.tag == 48) {
                    ErrorMessg erroMs = new ErrorMessg(token.tag, token.row, token.col, token.value);
                    System.out.println(erroMs.DisplayError());
                    ErrorList.add(token);
                }
                else {
                    TokenList.add(token);
                }
            } 
        } catch (LexicalException lexEx){
            System.out.println(lexEx);
        }

    }

    public void printTokenList(){
        System.out.println("Tokens found:");
        for (Token token : TokenList) {
            System.out.println(token.displayToken());
        }
    }

    public void printErrorList(){
        System.out.println("Errors found:");
        for (Token token : ErrorList) {
             System.out.println(token.displayErrors());
        }
    }

}