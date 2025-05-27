package nodos;

import java.util.HashMap;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

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
        String expResult = expresion.assemble(asm, auxCount);
        String idResult = identificador.assemble(asm, auxCount);
        SymbolTableEntry entry = symbolTable.get(idResult);
        asm.append("\n");
        if (entry != null && Objects.equals(entry.getTipo(), "STRING")) {
            asm.append("mov edi, offset ").append(idResult).append("\n");
            asm.append("mov esi, offset ").append(expResult).append("\n");
            asm.append("mov ecx, ").append(symbolTable.get(expResult).getLongitud() + 1).append("\n");
            asm.append("cld").append("\n");
            asm.append("rep movsb").append("\n");
        }
        else {
            asm.append("fld ").append(expResult).append("\n")
               .append("fstp ").append(idResult);
        }
        asm.append("\n");
        return "";
    }
}
