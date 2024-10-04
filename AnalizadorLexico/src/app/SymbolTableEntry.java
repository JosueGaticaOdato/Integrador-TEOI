package app;

//Clase para realizar la creacion de la tabla de simbolos
public class SymbolTableEntry {
	private String nombre;
	private String token;
	public String tipo;
	public String valor;
	private String longitud;
	
	public SymbolTableEntry (String valor, String token) {
		this.nombre = "_" + valor;
		this.token = token;
		this.tipo = "-";
		this.longitud = "-";
		this.valor = valor;
		if(this.token.equals("CONST_STR")) {
			this.valor = this.valor.substring(1, this.valor.length() - 1);
		    this.nombre = "_" + this.valor;
			Integer longitudAsInt = this.valor.length();
			this.longitud =  longitudAsInt.toString();    
		}
		
		if(this.token.equals("ID")) {
			this.tipo = " ";
			this.nombre = valor;
			this.valor = "-";
		}
	}
	
	public String getToken() {
		return this.token;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getEntry() {
		return String.format("%-25s | %-15s | %-10s | %-25s |%-5s", nombre, token, tipo, valor, longitud);
	}
	
}