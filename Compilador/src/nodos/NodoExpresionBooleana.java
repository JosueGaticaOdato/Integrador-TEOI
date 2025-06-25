package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoExpresionBooleana extends Nodo {
     
     public NodoExpresionBooleana(String nombre) {
        super(nombre);
    }
     
    protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight, HashMap<String, SymbolTableEntry> symbolTable) {
		return null;
	}
      
}

    
    
    
