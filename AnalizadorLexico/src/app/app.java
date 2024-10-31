package app;

import java.io.IOException;

public class app {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		/*try {
			FileReader f = new FileReader("../prueba.txt");
			Lexico Lexer = new Lexico(f);
			Lexer.next_token();
		} catch (FileNotFoundException ex) 
		{
			System.out.println("No se encontro el archivo");
		}*/
		try {
			Vista vista = new Vista();
			vista.frame.setVisible(true);
		}catch (Exception e) {
			System.out.println("Hubo un problema en la compilacion:" + e);
		}
	}

}
