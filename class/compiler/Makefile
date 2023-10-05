# Nombre del archivo fuente
SOURCE_FILE = Compiler.java

# Nombre del archivo de salida
OUTPUT_FILE = Compiler.class

# Comando para compilar
JAVAC = javac

# Parámetros para el compilador
JAVAC_FLAGS = 

# Nombre del archivo que se pasará como argumento al ejecutar
FILENAME = mi_archivo.txt


all: $(SOURCE_FILE)
    $(JAVAC) $(JAVAC_FLAGS) $(SOURCE_FILE)

run: $(OUTPUT_FILE)
    $(JAVA) $(OUTPUT_FILE) $(FILENAME)

clean:
    rm -f $(OUTPUT_FILE)