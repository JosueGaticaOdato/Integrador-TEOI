package app;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;
import javax.swing.SwingConstants;

import nodos.NodoPrograma;

public class Vista {

	JFrame frame;
	
	File archivoTS = new File("ts.txt");
	File archivoCodigo = new File("entrada.txt");

	public Vista() {
		initialize();
	}

	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 25, 924, 490);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//Panel
		JPanel panel = new JPanel();
		frame.getContentPane().add(panel, BorderLayout.CENTER);
		panel.setLayout(null);
		 
		// -------------- Pantalla donde se podra cargar codigo de forma manual -------------
		
		JLabel lblNewLabel = new JLabel("Entrada");
		lblNewLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		lblNewLabel.setFont(new Font("Calibri", Font.ITALIC, 18));
		lblNewLabel.setForeground(new Color(0, 0, 0));
		lblNewLabel.setBounds(10, 10, 104, 24);
		panel.add(lblNewLabel);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane_1.setBounds(10, 39, 404, 296);
		panel.add(scrollPane_1);
		
		JTextArea inputTextArea = new JTextArea();
		scrollPane_1.setViewportView(inputTextArea);
		inputTextArea.setWrapStyleWord(true);
		inputTextArea.setLineWrap(true);
		
		// -------------- Pantalla donde se podra ver la salida del codigo, mostrando los tokens y lexemas encontrados -------------
		
		JLabel lblResultadoCompilacion = new JLabel("Resultado compilación");
		lblResultadoCompilacion.setVerticalAlignment(SwingConstants.BOTTOM);
		lblResultadoCompilacion.setForeground(new Color(0, 0, 0));
		lblResultadoCompilacion.setFont(new Font("Calibri", Font.ITALIC, 18));
		lblResultadoCompilacion.setBounds(484, 10, 231, 24);
		panel.add(lblResultadoCompilacion);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane.setBounds(484, 39, 404, 296);
		panel.add(scrollPane);
		
		JTextArea outputTextArea = new JTextArea();
		scrollPane.setViewportView(outputTextArea);
		outputTextArea.setWrapStyleWord(true);
		outputTextArea.setLineWrap(true);
		outputTextArea.setEditable(false);
		
		// -------------- Limpiar pantalla -------------
		
		JButton btnClear = new JButton("Limpiar");
		btnClear.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				inputTextArea.setText("");
				outputTextArea.setText("");
			}
		});
		btnClear.setForeground(new Color(255, 255, 255));
		btnClear.setBackground(new Color(248, 38, 38));
		btnClear.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnClear.setBounds(484, 358, 190, 44);
		btnClear.setCursor(new Cursor(Cursor.HAND_CURSOR));
		panel.add(btnClear);
		
		// -------------- Manejo de archivo donde se guardara la tabla de simbolos -------------
		
		JLabel filePath = new JLabel("ts.txt");
		filePath.setVerticalAlignment(SwingConstants.BOTTOM);
		filePath.setFont(new Font("Calibri", Font.ITALIC, 14));
		filePath.setBounds(10, 366, 309, 24);
		panel.add(filePath);
	
		
		JLabel informationLabel = new JLabel("Indique la ubicacion destino del archivo ts.txt (tabla de simbolos)");
		informationLabel.setFont(new Font("Calibri", Font.PLAIN, 15));
		informationLabel.setBounds(10, 346, 404, 20);
		panel.add(informationLabel);
		
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.setSelectedFile(new File("ts.txt"));
		
		// -------------- Compliacion del archivo/codigo en pantalla -------------
		
		//Boton que realiza la complicacion del codigo
		JButton btnCompile = new JButton("Compilar");
		btnCompile.setForeground(new Color(255, 255, 255));
		btnCompile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				parser sintactico = null;
					
				try {
							
					//Dado el codigo presente en la pantalla de input
					Reader reader = new StringReader(inputTextArea.getText());
					
					//Path con la ubicacion al archivo ts.txt a crear donde se guarda la tabla de simbolos
					String path = filePath.getText();
					
					//Creo el objeto Lexico pasandole el codigo y el path donde se guardara la tabla de simbolos
					//Lexico lexer = new Lexico(reader, path);
					Lexico lexer = new Lexico(reader);
					//lexer.next_token();
					
					//sintactico = new parser(lexer, lexer.getTS());
					sintactico = new parser(lexer, lexer.getTS());
					//sintactico.parse();
					NodoPrograma programa = (NodoPrograma) sintactico.parse().value;
		
					outputTextArea.setText("");
		
					// Obtengo la lista de elementos que fue guardando el Lexico
					//ArrayList<String> elements = lexer.getList();
					ArrayList<String> elements = (ArrayList<String>) sintactico.getList();
					
					//Recorro la lista y muestro la salida en pantalla
					for (int i = 0; i < elements.size(); i++) {
						outputTextArea.setForeground(Color.getColor("#1b7161"));
						String element = elements.get(i);
						outputTextArea.append(element + "\n"); //Salto de linea al final
						System.out.println(element);
					}
		
					lexer.vaciarLista();
					
					try {
						FileWriter archivo = new FileWriter("arbol.dot");
			            PrintWriter pw = new PrintWriter(archivo);
			            pw.println(programa.graficar());
			            archivo.close();
			            FileWriter asm = new FileWriter("ContarPrimos" + ".asm");
			            PrintWriter pw2 = new PrintWriter(asm);
			            
			            ArrayList<SymbolTableEntry> ts = (ArrayList<SymbolTableEntry>) parser.getTS();
			            PrintWriter writer = null;
			            try {
			              File file = new File(path);
			              file.createNewFile();
			              writer = new PrintWriter(new FileWriter(path));
			            } catch (IOException ex) {
			              ex.printStackTrace();
			            }
			            if (writer != null) {
			              String header = String.format(
			                "%-25s | %-15s | %-10s | %-25s |%-5s",
			                "NOMBRE",
			                "TOKEN",
			                "TIPO",
			                "VALOR",
			                "LONGITUD"
			              );
			              writer.println(header);
			              for (SymbolTableEntry entryInstance : ts) {
			                String entry = entryInstance.getEntry();
			                writer.println(entry);
			              }
			              writer.close();
			            }
			            
			            // Convertir la tabla de símbolos a HashMap
			            HashMap<String, SymbolTableEntry> symbolTable = lexer.getSymbolTableAsMap();
			            // Generar código assembler
			            String assembler = programa.assemble(symbolTable);
			            
			            pw2.println(assembler);
			            asm.close();
			            
			            
					} catch (Exception e1) {
						System.out.println(e1);
					}
		            

				} catch(Exception error ) {
					outputTextArea.setForeground(Color.RED);
					if(!error.getMessage().equals("Can't recover from previous error(s)")) {
            	//JOptionPane.showMessageDialog(null,  error.getMessage(), "Constante fuera de rango", JOptionPane.ERROR_MESSAGE);
              outputTextArea.setText(error.getMessage());
          } else {
              outputTextArea.setText(parser.getErrorMsg());	
          }
				}
				
			    String cmd = "C:\\Program Files (x86)\\Graphviz2.34\\bin\\dot -Tpng arbol.dot -o arbol.png";
			    try {
					Runtime.getRuntime().exec(cmd);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
				
		});
		btnCompile.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnCompile.setBounds(698, 358, 190, 44);
		btnCompile.setCursor(new Cursor(Cursor.HAND_CURSOR));
		btnCompile.setEnabled(true);
		btnCompile.setBackground(new Color(0, 196, 0));
		panel.add(btnCompile);
		
		//Boton para buscar donde dejar el archivo
		JButton exploreBtn = new JButton("Explorar ...");
		exploreBtn.setFont(new Font("Calibri", Font.PLAIN, 12));
		exploreBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			    int returnValue = fileChooser.showOpenDialog(null);

	            if (returnValue == JFileChooser.APPROVE_OPTION) {
	                java.io.File selectedFile = fileChooser.getSelectedFile();
	                filePath.setText(selectedFile.getAbsolutePath());
	                informationLabel.setText("Ubicacion seleccionada:");
	                btnCompile.setEnabled(true);
	                btnCompile.setBackground(new Color(0, 196, 0));
	            } else {
	            	filePath.setText("Ubicacion no seleccionada");
	            	btnCompile.setEnabled(false);
	            	btnCompile.setBackground(new Color(240, 240, 240));
	            	informationLabel.setText("Indicar ubicacion destino del archivo ts.txt");
	            }
			}
		});
		exploreBtn.setBounds(10, 394, 85, 30);
		panel.add(exploreBtn);
		
		
		
		// -------------- Manejo de archivo donde se importara el codigo de un archivo .txt ------------
		
		JButton btnArchivo = new JButton("Buscar archivo con codigo");
		btnArchivo.setFont(new Font("Calibri", Font.PLAIN, 12));
		btnArchivo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
		        fileChooser.showOpenDialog(null);

		        File file = fileChooser.getSelectedFile();
		        if (file != null) {
		        	try {
		        		FileReader fileReader = new FileReader(file);
		        		BufferedReader bufferedReader = new BufferedReader(fileReader);
		                String linea;
		                while ((linea = bufferedReader.readLine()) != null) {
		                    inputTextArea.append(linea + "\n");
		                }

		                bufferedReader.close();
		        	} catch (Exception error){
		        		JOptionPane.showMessageDialog(null, "Error", "Error al abrir el archivo", JOptionPane.ERROR_MESSAGE);
		        	}
		        }
		}
		});
		btnArchivo.setBounds(201, 8, 213, 30);
		panel.add(btnArchivo);
		
		// -------------- Carga de entrada.txt directamente en input ----------------
		
		try {
		    if (archivoCodigo.exists()) {
		        BufferedReader bufferedReader = new BufferedReader(new FileReader(archivoCodigo));
		        String linea;
		        while ((linea = bufferedReader.readLine()) != null) {
		            inputTextArea.append(linea + "\n");
		        }
		        bufferedReader.close();
		    } else {
		        JOptionPane.showMessageDialog(null, "No se encontró el archivo por defecto.", "Archivo no encontrado", JOptionPane.WARNING_MESSAGE);
		    }
		} catch (Exception error) {
		    JOptionPane.showMessageDialog(null, "Error al abrir el archivo por defecto.", "Error", JOptionPane.ERROR_MESSAGE);
		    error.printStackTrace();
		}
		
		// ------------------ Carga de ts.txt directamente -------------------------
		
	}
}
