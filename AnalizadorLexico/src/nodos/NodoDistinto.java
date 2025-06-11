package nodos;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class NodoDistinto extends NodoComparacion {

	  public NodoDistinto(NodoExpresion left, NodoExpresion right) {
	    super("!=", left, right);
	    System.out.println("Nodo distinto");
	  }

	  @Override
	  protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
	    String leftChild = getIzquierda().assemble(asm, auxCount);
	    String rightChild = getDerecha().assemble(asm, auxCount);
	    asm.append("\n");

	    String comp = inverse ? "JE" : "JNE";
	    asm.append("FLD ").append(leftChild).append("\n")
	       .append("FLD ").append(rightChild).append("\n")
	       .append("FCOMP ").append("\n")
	       .append(comp).append(" ")
	       .append(Optional.ofNullable(jumpToLeft).orElse(jumpToRight));
	    return "";
	  }
	  
	  /*
	   *   @Override
  protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
    // Primero se ensamblan los operandos (deben hacer FLD)
    getDerecha().assemble(asm, auxCount);  // FLD right
    getIzquierda().assemble(asm, auxCount); // FLD left

    // Compara ST(0) con ST(1) y setea flags, luego libera ST(1)
    asm.append("fcomip st(0), st(1)\n");
    asm.append("fstp st(0)\n"); // Limpia lo que quedó en el tope de la FPU

    // Decide el salto según si es inverso o no
    String jumpInstr = inverse ? "je" : "jne"; // distinto → JNE (si NO es igual)
    asm.append(jumpInstr).append(" ").append(jumpToLeft).append("\n");
    asm.append("jmp ").append(jumpToRight).append("\n");

    return "";
  }*/
}
