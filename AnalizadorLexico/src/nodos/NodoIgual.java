package nodos;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class NodoIgual extends NodoComparacion {

	  public NodoIgual(NodoExpresion left, NodoExpresion right) {
	    super("==", left, right);
	    System.out.println("Nodo distinto");
	  }

	  @Override
	  protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
	    String leftChild = getIzquierda().assemble(asm, auxCount);
	    String rightChild = getDerecha().assemble(asm, auxCount);
	    asm.append("\n");

	    String comp = inverse ? "JNE" : "JE";

	    asm.append("FLD ").append(leftChild).append("\n")
	       .append("FLD ").append(rightChild).append("\n")
	       .append("FCOM\n")
	       .append("FSTSW AX\n")
	       .append("SAHF\n")
	       .append(comp).append(" ").append(
	         Optional.ofNullable(jumpToLeft).orElse(jumpToRight)
	       ).append("\n");

	    return "";
	  }
}
