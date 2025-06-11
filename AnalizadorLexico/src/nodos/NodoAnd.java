package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoAnd extends NodoExpresionBooleana {
        
       private final NodoExpresionBooleana izquierda;
       private final NodoExpresionBooleana derecha;

	   public NodoAnd (NodoExpresionBooleana izquierda, NodoExpresionBooleana derecha) {
	        super("AND");
	        this.izquierda = izquierda;
	        this.derecha = derecha;
	   }
	   
	   @Override
	   protected String graficar(String idPadre) {
	       final String miId = this.getIdNodo();
	       return super.graficar(idPadre) +
	                izquierda.graficar(miId) +
	                derecha.graficar(miId);
	   }
 
	  @Override
	  protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
		  izquierda.assemble(asm, auxCount, Boolean.TRUE, jumpToLeft, null);
		  derecha.assemble(asm, auxCount, Boolean.TRUE, jumpToLeft, null);
		  return "";
	  }

}

