package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoResta extends NodoExpresionBinaria {

    public NodoResta(NodoExpresion izquierda, NodoExpresion derecha) {
        super("-", izquierda, derecha);
    }
    
    /*@Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        String leftChild = getIzquierda().assemble(asm, auxCount);
        String rightChild = getDerecha().assemble(asm, auxCount);
        asm.append("\n");
        asm
            .append("FLD ").append(leftChild).append("\n")
            .append("FLD ").append(rightChild).append("\n")
            .append("FSUB").append("\n")
            .append("FSTP _@aux").append(auxCount.get())
            .append("\n");
        return "_@aux" + auxCount.getAndIncrement();
    }*/
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
        String leftChild = getIzquierda().assemble(asm, symbolTable,auxCount);
        String rightChild = getDerecha().assemble(asm, symbolTable, auxCount);
        asm.append("\n");
        asm
            .append("FLD ").append(leftChild).append("\n")
            .append("FLD ").append(rightChild).append("\n")
            .append("FSUB").append("\n")
            .append("FSTP _@aux").append(auxCount.get())
            .append("\n");
        return "_@aux" + auxCount.getAndIncrement();
    }
    
    @Override
    public NodoExpresion clonar() {
        return new NodoResta(izquierda.clonar(), derecha.clonar());
    }
    
    
}