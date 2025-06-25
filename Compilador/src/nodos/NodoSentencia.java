package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoSentencia extends Nodo {

    public NodoSentencia(String nombre) {
        super(nombre);
    }
    
    public String assemble(StringBuilder resultado,  HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
		return null;
	}
}
