package app;

import java.awt.Color;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;

import nodos.NodoPrograma;

public class app {

	/*public static void main(String[] args) throws IOException {
		try {
			Vista vista = new Vista();
			vista.frame.setVisible(true);
		}catch (Exception e) {
			System.out.println("Hubo un problema en la compilacion:" + e);
		}
	}*/
	public static void main(String[] args) throws Exception {
		parser sintactico= new parser (new Lexico(new FileReader("entrada.txt")));
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
        } catch (Exception e) {
            System.out.println(e);
        }
    String cmd = "C:\\Program Files (x86)\\Graphviz2.34\\bin\\dot -Tpng arbolito.dot -o arbolito.png";
    Runtime.getRuntime().exec(cmd);
    }
}
