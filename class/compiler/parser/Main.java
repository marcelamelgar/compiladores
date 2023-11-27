import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            Reader reader = new FileReader("prueba.txt");
            GeneratedLexer lexer = new GeneratedLexer(reader);

            Symbol symbol;
            while ((symbol = lexer.next_token()) != null) {
                System.out.println("Token: " + getSymbolName(symbol.sym) + ", Value: " + symbol.value);
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error during lexing: " + e.getMessage());
        }
    }

    private static String getSymbolName(int sym) {
        // Use reflection to find the field name in the 'sym' class
        for (java.lang.reflect.Field field : Sym.class.getFields()) {
            try {
                if (field.getInt(null) == sym) {
                    return field.getName();
                }
            } catch (IllegalAccessException e) {
                System.err.println("Error accessing sym class: " + e.getMessage());
            }
        }
        return "UNKNOWN";
    }
}
