package assembler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;

import app.Lexico;
import app.SymbolTableEntry;
import app.sym;

public class ParserHelper {

    private final Lexico lexico;
    private HashMap<String, SymbolTableEntry> symbolTable = new HashMap();

    private Stack<Integer> types = new Stack<>();

    private List<String> varNames = new ArrayList<>();

    public ParserHelper (Lexico lexico) {
        this.lexico = lexico;
    }

    public void setSymbolTable(HashMap<String, SymbolTableEntry> symbolTable){
        this.symbolTable = symbolTable;
    }

    public HashMap<String, SymbolTableEntry>  getSymbolTable() {
        return this.symbolTable;
    }

    public void typeDef(Integer type){
        types.push(type);
    }

    public void varDef(String name){
        varNames.add(name);
    }

    public void loadVarsAndTypes(){
        varNames.forEach(var -> {
            Integer dataType = types.pop();
            SymbolTableEntry symbolTableEntry = new SymbolTableEntry(lexico.getNombreToken(sym.ID),
                    lexico.getNombreToken(dataType), null, null);
            symbolTable.put(var, symbolTableEntry);
        });

        varNames = new ArrayList<>();
    }

    private String preprocessSymbol(String symbol) {
        return "_" + symbol.replace(" ", "_").replace(".", "_point_").replaceAll("[¡!¿?]", "_");
    }

    public void addCteInt(Number cte) {
        String cteNumString = Integer.toString(cte.intValue());
        String string_literal_aux = preprocessSymbol(cteNumString);
        SymbolTableEntry symbolTableEntry =
                new SymbolTableEntry(lexico.getNombreToken(sym.INTEGER), lexico.getNombreToken(sym.CONST_INTEGER), cteNumString, null);
        symbolTable.put(string_literal_aux, symbolTableEntry);
    }
    
    /*public void addCteInt(Number cte) {
        String cteNumString = Integer.toString(cte.intValue());
        String string_literal_aux = preprocessSymbol(cteNumString);
        SymbolTableEntry symbolTableEntry =
                new SymbolTableEntry(lexico.getNombreToken(sym.INTEGER_LITERAL), lexico.getNombreToken(sym.INT), cteNumString, null);
        symbolTable.put(string_literal_aux, symbolTableEntry);
    }

    public void addCteFloat(Number cte) {
        String cteNumString = cte.toString();
        String string_literal_aux = preprocessSymbol(cteNumString);
        SymbolTableEntry symbolTableEntry =
                new SymbolTableEntry(lexico.getNombreToken(sym.FLOATING_POINT_LITERAL), lexico.getNombreToken(sym.FLOAT), cteNumString, null);
        symbolTable.put(string_literal_aux, symbolTableEntry);
    }

    public void addCteString(String cte){
        String string_literal_aux = preprocessSymbol(cte);
        SymbolTableEntry symbolTableEntry =
                new SymbolTableEntry(lexico.getNombreToken(sym.STRING_LITERAL), lexico.getNombreToken(sym.STRING), cte, cte.length());
        symbolTable.put(string_literal_aux, symbolTableEntry);
    }*/

    public void checkVar(String var) {
        if (!symbolTable.containsKey(var)) {
            throw new IllegalArgumentException(var + " is not defined");
        }
    }

}