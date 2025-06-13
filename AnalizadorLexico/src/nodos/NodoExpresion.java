package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoExpresion extends Nodo {

    public NodoExpresion(String nombre) {
        super(nombre);
    }
    
    public NodoExpresion clonar() {
		return null;
	}
    
    public String getValor() {
    	return null;
    }

    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
		return null;
	}
    
	public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
		// TODO Auto-generated method stub
		return null;
	}
}
