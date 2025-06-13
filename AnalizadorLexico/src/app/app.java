package app;

import java.io.IOException;

public class app {

	public static void main(String[] args) throws IOException {
		try {
			Vista vista = new Vista();
			vista.frame.setVisible(true);
		}catch (Exception e) {
			System.out.println("Hubo un problema en la compilacion:" + e);
		}
	}
	
	/*public static void guardarTablaDeSimbolos(ArrayList<SymbolTableEntry> ts, String path) {
	    try {
	        File file = new File(path);
	        file.createNewFile();
	        PrintWriter writer = new PrintWriter(new FileWriter(file));

	        String header = String.format(
	            "%-25s | %-15s | %-10s | %-25s |%-5s",
	            "NOMBRE",
	            "TOKEN",
	            "TIPO",
	            "VALOR",
	            "LONGITUD"
	        );
	        writer.println(header);

	        for (SymbolTableEntry entry : ts) {
	            writer.println(entry.getEntry());
	        }

	        writer.close();
	    } catch (IOException ex) {
	        ex.printStackTrace();
	    }
	}
	
	public static void main(String[] args) throws Exception {
		Lexico lexer = new Lexico(new FileReader("entrada.txt"));
		parser sintactico = new parser(lexer);
        NodoPrograma programa = (NodoPrograma) sintactico.parse().value;
        ArrayList<String> elements = (ArrayList<String>) sintactico.getList();
		
		//Recorro la lista y muestro la salida en pantalla
		for (int i = 0; i < elements.size(); i++) {
			String element = elements.get(i);
			System.out.println(element);
		}
     
        try {
            FileWriter archivo = new FileWriter("arbolito.dot");
            PrintWriter pw = new PrintWriter(archivo);
            pw.println(programa.graficar());
            archivo.close();
            FileWriter asm = new FileWriter("ContarPrimos" + ".asm");
            PrintWriter pw2 = new PrintWriter(asm);
            
            guardarTablaDeSimbolos(lexer.getTS(), "ts.txt");
            // Convertir la tabla de símbolos a HashMap
            HashMap<String, SymbolTableEntry> symbolTable = lexer.getSymbolTableAsMap();
            // Generar código assembler
            String assembler = programa.assemble(symbolTable);
            
            pw2.println(assembler);
            asm.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    String cmd = "C:\\Program Files (x86)\\Graphviz2.34\\bin\\dot -Tpng arbolito.dot -o arbolito.png";
    Runtime.getRuntime().exec(cmd);
    }*/
}
