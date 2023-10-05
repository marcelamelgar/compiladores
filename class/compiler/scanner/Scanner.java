import java.util.LinkedList;
import java.io.*;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Scanner {
    String fileName;
    LinkedList <Token> TokenList = new LinkedList<>();
    LinkedList <Token> ErrorList = new LinkedList<>();

    public Scanner(String fileName){
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

    public File writeDataToCSVFile(){
        File csvFile = new File("tokenTable.csv");
        String[] headers = {"type", "row", "column", "value"};
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(csvFile))){
            for (String header : headers){
                 writer.write(header);
                 writer.write(",");
            }
            writer.newLine();
            for (Token token : TokenList){
                writer.write(token.csvFormat());
                writer.newLine();
            }
            
        } catch (IOException e){
            e.printStackTrace();
        }
        return csvFile;
    }
}