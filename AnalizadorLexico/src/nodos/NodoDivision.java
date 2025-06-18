package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoDivision extends NodoExpresionBinaria {

    public NodoDivision(NodoExpresion izquierda, NodoExpresion derecha) {
        super("/", izquierda, derecha);
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        String leftChild = getIzquierda().assemble(asm, auxCount);
        String rightChild = getDerecha().assemble(asm, auxCount);
        asm.append("\n");
        asm.append("FLD ").append(leftChild).append("\n")
           .append("FDIV ").append(rightChild).append("\n")
           .append("FSTP _@aux").append(auxCount.get()).append("\n");
        return "_@aux" + auxCount.getAndIncrement();

    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
        String leftChild = getIzquierda().assemble(asm, auxCount);
        String rightChild = getDerecha().assemble(asm, auxCount);
        asm.append("\n");
        asm.append("FLD ").append(leftChild).append("\n")
           .append("FDIV ").append(rightChild).append("\n")
           .append("FSTP _@aux").append(auxCount.get()).append("\n");
        return "_@aux" + auxCount.getAndIncrement();

    }
    
    
}
