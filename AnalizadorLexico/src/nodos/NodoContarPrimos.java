package nodos;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoContarPrimos extends NodoExpresion {
    private List<NodoSentencia> instrucciones;
    private NodoIdentificador resultado;

    public NodoContarPrimos(List<NodoSentencia> instrucciones, NodoIdentificador resultado) {
    	super("CONTARPRIMOS");
    	this.instrucciones = instrucciones;
        this.resultado = resultado;
    }

    // método para graficar (puede recorrer las instrucciones)
    @Override
    public String graficar(String idPadre) {
        StringBuilder sb = new StringBuilder();
        String id = getIdNodo();
        sb.append(String.format("%s [label=\"ContarPrimos\"]\n", id));
        sb.append(String.format("%s -- %s\n", idPadre, id));
        for (NodoSentencia ins : instrucciones) {
            sb.append(ins.graficar(id));
        }
        return sb.toString();
    }

    // getter para el resultado (el valor final de k)
    public NodoIdentificador getResultado() {
        return resultado;
    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
    	asm.append("; === INICIO ContarPrimos ===\n");
    	for (NodoSentencia instruccion : instrucciones) {
    	    instruccion.assemble(asm, symbolTable, auxCount);
    	}
    	asm.append("; === FIN ContarPrimos ===\n");
    	
        return resultado.assemble(asm, auxCount); // Opcional: devuelve el nombre del resultado, por si lo querés usar
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        // Llamamos al otro método, suponiendo que tengas acceso a la symbolTable (pasala si podés)
    	System.out.println("assemble");
        throw new UnsupportedOperationException("Usá el assemble con symbolTable para ContarPrimos");
    }
    
    void registrarVariable(String nombre, HashMap<String, SymbolTableEntry> symbolTable) {
        if (!symbolTable.containsKey(nombre)) {
            SymbolTableEntry entry = new SymbolTableEntry(nombre, "FLOAT");
            entry.setLongitud("0");
            symbolTable.put(nombre, entry);
        }
    }

    void registrarConstante(String nombre, double valor, HashMap<String, SymbolTableEntry> symbolTable) {
        String key = "_" + ((int) valor);
        if (!symbolTable.containsKey(key)) {
            SymbolTableEntry entry = new SymbolTableEntry(key, "CONST");
            entry.setValor(String.valueOf(valor));
            symbolTable.put(key, entry);
        }
    }
}