package compiler;
import scanner.Scanner;

import java.io.File;

public class Compiler {
    public static void main(String[] args){
        if (args.length != 1) {
            System.out.println("Uso incorrecto. Debe proporcionar el nombre del archivo.");
            return;
        }

        String filename = args[0];
        System.out.println("Compilando archivo: " + filename);

        // Llama al scanner y pasa el filename
        Scanner scanner = new Scanner(filename);
        scanner.TokenScanner();
        scanner.printTokenList();
        scanner.printErrorList();
        File newFile = scanner.writeDataToCSVFile();
        System.out.println("CSV file path: " + newFile.getAbsolutePath());
    }

    }
}