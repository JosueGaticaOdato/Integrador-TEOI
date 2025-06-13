package nodos;

public class NodoComparacionFactory {

	  public NodoComparacion from(String op, NodoExpresion left, NodoExpresion right) {
	    System.out.println(op);
	    switch (op) {
	      case "==": return new NodoIgual(left, right);
	      case "<": return new NodoMenor(left, right);
	      case "<=": return new NodoMenorIgual(left, right);
	      case ">": return new NodoMayor(left, right);
	      case ">=": return new NodoMayorIgual(left, right);
	      case "!=": return new NodoDistinto(left, right);
	    }
	    throw new IllegalArgumentException("Unknown comparison symbol \"" + op + "\"");
	  }

	}