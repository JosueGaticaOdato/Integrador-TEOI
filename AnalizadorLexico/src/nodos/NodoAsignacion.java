package nodos;

import app.SymbolTableEntry;
import java.util.HashMap;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

public class NodoAsignacion extends NodoSentencia {

	private final NodoIdentificador identificador;
    private final NodoExpresion expresion;

    public NodoAsignacion(NodoIdentificador identificador, NodoExpresion expresion) {
        super(":=");
        this.identificador = identificador;
        this.expresion = expresion;
    }

    @Override
    protected String graficar(String idPadre) {
        final String miId = this.getIdNodo();
        return super.graficar(idPadre) +
                identificador.graficar(miId) +
                expresion.graficar(miId);
    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
        //String expResult = expresion.assemble(asm, auxCount);
        String expResult;
        if (expresion instanceof NodoContarPrimos) {
            expResult = ((NodoContarPrimos) expresion).assemble(asm, symbolTable, auxCount);
        } else {
            expResult = expresion.assemble(asm, symbolTable, auxCount);
        	//expResult = expresion.assemble(asm, auxCount);
        }
        String idResult = identificador.assemble(asm, symbolTable, auxCount);
        SymbolTableEntry entry = symbolTable.get(idResult);
        if (expresion instanceof NodoConstanteString) {
            entry.setLongitud(Integer.toString(((NodoConstanteString) expresion).getValor().length()));
        }
        //System.out.println(entry.getLongitud());
        asm.append("\n");
        if (entry != null && Objects.equals(entry.getTipo(), "STRING")) {
            asm.append("mov edi, offset ").append(idResult).append("\n");
            asm.append("mov esi, offset ").append(expResult.replace("'","")).append("\n");
            //asm.append("mov ecx, ").append(symbolTable.get(expResult).getLongitud() + 1).append("\n");
            asm.append("mov ecx, ").append(entry.getLongitud() + 1).append("\n");
            asm.append("cld").append("\n");
            asm.append("rep movsb").append("\n");
        }
        else if (Objects.equals(entry.getTipo(), "FLOAT") && (expResult.contains("point"))){
            asm.append("fld ").append(expResult).append("\n")
               .append("fstp ").append(idResult);
        }
        else if (Objects.equals(entry.getTipo(), "FLOAT")){
            asm.append("fld ").append(expResult).append("\n")
            .append("frndint ").append("\n")
               .append("fstp ").append(idResult);
        } else {
        	asm.append("fld ").append(expResult).append("\n")
        	.append("frndint ").append("\n")
            .append("fistp ").append(idResult);
        }
        asm.append("\n");
        return "";
    }
}
