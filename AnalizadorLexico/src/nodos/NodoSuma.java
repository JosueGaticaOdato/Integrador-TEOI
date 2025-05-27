package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoSuma extends NodoExpresionBinaria {

    public NodoSuma(NodoExpresion izquierda, NodoExpresion derecha) {
        super("+", izquierda, derecha);
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        String leftChild = getIzquierda().assemble(asm, auxCount);
        String rightChild = getDerecha().assemble(asm, auxCount);
        asm.append("\n");
        asm
            .append("FLD ").append(leftChild).append("\n")
            .append("FLD ").append(rightChild).append("\n")
            .append("FADD").append("\n")
            .append("FSTP _@aux").append(auxCount.get())
            .append("\n");
        return "_@aux" + auxCount.getAndIncrement();
    }
}