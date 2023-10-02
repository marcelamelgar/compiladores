// import java.io.BufferedReader;
// import java.io.FileReader;
import java.io.IOException;
// import java.util.LinkedList;
import java.io.File;

public class Main {
    public static void main(String[] args) throws IOException {
        Scanner newScanner = new Scanner("prueba.txt");
        newScanner.TokenScanner();
        newScanner.printTokenList();
        newScanner.printErrorList();
        File newFile = newScanner.writeDataToCSVFile();
        System.out.println("CSV file path: " + newFile.getAbsolutePath());
    }
    //     GeneratedLexer lexer = new GeneratedLexer(new BufferedReader(new FileReader("prueba.txt")));
    //     Token token;
    //     LinkedList <Token> TokenList = new LinkedList<>();
    //     LinkedList <Token> ErrorList = new LinkedList<>();
    //     try{
    //         while ((token = lexer.yylex()) != null) {
    //             if (token.tag == 48) {
    //                 ErrorMessg erroMs = new ErrorMessg(token.tag, token.row, token.col, token.value);
    //                 System.out.println(erroMs.DisplayError());
    //                 ErrorList.add(token);
    //             }
    //             else {
    //                 System.out.println("Token: " + token.tag + " Value: " + token.value + "\nRow: " + token.row + " Column: " + token.col);
    //                 TokenList.add(token);
    //             }
    //             //System.out.println("Token: " + token.tag + " Value: " + token.value + "\nRow: " + token.row + " Column: " + token.col);
    //         } 
    //     } catch (LexicalException lexEx){
    //         System.out.println(lexEx);
    //     }

    //     for (Token item : TokenList) {
    //         System.out.println(item.displayToken());
    //     }

    //     for (Token item : ErrorList) {
    //         System.out.println(item.displayErrors());
    //     }
    // }
}
