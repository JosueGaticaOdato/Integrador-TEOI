
package nodos;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class NodoMenor extends NodoComparacion {
        
    public NodoMenor (NodoExpresion izquierda, NodoExpresion derecha) {
    	super("<", izquierda, derecha);
    }
    
    @Override
    protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
      String leftChild = getIzquierda().assemble(asm, auxCount);
      String rightChild = getDerecha().assemble(asm, auxCount);
      asm.append("\n");

      String comp = inverse ? "JAE" : "JB";
      asm.append("FLD ").append(leftChild).append("\n")
          .append("FLD ").append(rightChild).append("\n")
          .append("FXCH").append("\n")
          .append("FCOMP ").append("\n")
          .append("FSTSW ax").append("\n")
          .append("SAHF").append("\n")
          .append(comp).append(" ")
          .append(Optional.ofNullable(jumpToLeft).orElse(jumpToRight));
      return "";
    }
}
