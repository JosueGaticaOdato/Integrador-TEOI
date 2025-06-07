package assembler;

import java.util.HashMap;

import app.SymbolTableEntry;

public class AssemblerHelper {

	  public static String buildHeader() {
	    return "include macros2.asm\n"
	        + "include number.asm\n"
	        + ".MODEL LARGE \n"
	        + ".386\n"
	        + ".STACK  200h \n";
	  }



	  public static String buildDataSection(HashMap<String, SymbolTableEntry> symbolTable, int auxCount) {
	    StringBuilder output = new StringBuilder();
	    output.append(".DATA\n");
	    symbolTable.forEach((symbol, entry) -> {
	      String dataType = translateDataType(entry.getTipo());
	      Object constVal = getSymbolTableEntryValue(entry);
	      output.append(symbol).append(" ").append(dataType).append(" ").append(constVal).append("\n");
	    });
	    for (int i = 0; i < auxCount; i++) {
	      output.append("_@aux").append(i).append(" dd ?\n");
	    }
	    return output.toString();
	  }

	  private static Object getSymbolTableEntryValue(SymbolTableEntry entry) {
	    if (entry.getValor() != null && entry.getValor() != "-") {
	      if (entry.getToken().equals("CONST_STR")) {
	        return String.format("\"%s$\"", entry.getValor());
	      }
	      if (entry.getToken().equals("CONST_INTEGER")) {
	        return entry.getValor() + ".0";
	      }
	      return entry.getValor();
	    }
	    return "?";
	  }

	  public static String buildCodeHeader() {
	    return ".CODE\n"
	        + "START:\n"
	        + "MOV EAX,@DATA\n"
	        + "MOV DS,EAX\n"
	        + "MOV ES,EAX\n";
	  }

	  //Tipo de dato: Solamente es db si hablamos de string
	  private static String translateDataType(String type) {
	    /*switch (type) {
	      case "INTEGER": return "dd";
	      case "FLOAT": return "dd";
	      case "STRING": return "db";
	      default: return "";
	    }*/
		switch (type) {
	      case "STRING": return "db";
	      default: return "dd";
	    }
	  }

	  public static String buildFooter() {
	    return "MOV EAX, 4C00h\n"
	        + "INT 21h\n"
	        + "END START\n"
	        + ";\n";
	  }



	}
