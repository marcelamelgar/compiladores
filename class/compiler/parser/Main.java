import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            Reader reader = new FileReader("prueba.txt");
            GeneratedLexer lexer = new GeneratedLexer(reader);

            Parser parser = new Parser(lexer); // Pass the lexer to the parser
            parser.setScanner(lexer); // Set the scanner for error handling

            Symbol symbol;
            while ((symbol = parser.parse()) != null) {
                if (symbol.sym == Sym.ERROR) {
                    // Handle the syntax error here
                    int line = symbol.left + 1; // Adjust for 0-based line numbers
                    int column = symbol.right + 1; // Adjust for 0-based column numbers
                    System.err.println("Syntax error at line " + line + ", column " + column + ": Unexpected token " + symbol.value);
                    // Optionally, throw an exception or exit the program
                } else {
                    if(getSymbolName(symbol.sym) == "EOF"){
                        System.out.println("No hay errores en el parser.");
                    }
                    System.out.println("Token: " + getSymbolName(symbol.sym) + ", Value: " + symbol.value);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error during analisis: " + e.getMessage());
        }
    }

    private static String getSymbolName(int sym) {
        // Use reflection to find the field name in the 'Sym' class
        for (java.lang.reflect.Field field : Sym.class.getFields()) {
            try {
                if (field.getInt(null) == sym) {
                    return field.getName();
                }
            } catch (IllegalAccessException e) {
                System.err.println("Error accessing Sym class: " + e.getMessage());
            }
        }
        return "UNKNOWN";
    }
}
