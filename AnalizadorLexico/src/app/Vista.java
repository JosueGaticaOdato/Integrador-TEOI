package app;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import javax.swing.SwingConstants;
import javax.swing.JTextArea;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

public class Vista {

	JFrame frame;

	public final int WIDTH = 600;
	public final int HEIGHT = 400;
	
	public final int x = 10;
	public final int y = 39;
	
	/**
	 * Create the application.
	 */
	public Vista() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 25, 924, 761);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		frame.getContentPane().add(panel, BorderLayout.CENTER);
		panel.setLayout(null);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane_1.setBounds(10, 39, 404, 592);
		panel.add(scrollPane_1);
		JTextArea inputTextArea = new JTextArea();
		scrollPane_1.setViewportView(inputTextArea);
		inputTextArea.setWrapStyleWord(true);
		inputTextArea.setLineWrap(true);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane.setBounds(484, 39, 404, 592);
		panel.add(scrollPane);
		
		JTextArea outputTextArea = new JTextArea();
		scrollPane.setViewportView(outputTextArea);
		outputTextArea.setWrapStyleWord(true);
		outputTextArea.setLineWrap(true);
		outputTextArea.setEditable(false);
		
		
		JLabel filePath = new JLabel("Ubicacion no seleccionada");
		filePath.setVerticalAlignment(SwingConstants.BOTTOM);
		filePath.setFont(new Font("Calibri", Font.ITALIC, 14));
		filePath.setBounds(10, 659, 309, 24);
		panel.add(filePath);
		
		JButton btnCompile = new JButton("Compilar");
		btnCompile.setForeground(new Color(255, 255, 255));
		btnCompile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {					
					Reader reader = new StringReader(inputTextArea.getText());
					// Usa la ubicacion definidad por el usuario para guardar el archivo 'ts.txt'
					String path = filePath.getText();
					Lexico lexer = new Lexico(reader, path);
					lexer.next_token();

					outputTextArea.setText("");

					// Obtengo la lista de elementos que fue guardando el Lexico

					List<String> elements = lexer.getList(); // Obtiene la lista
					//System.out.println(elements);
					
					for (int i = 0; i < elements.size(); i++) {
						outputTextArea.setForeground(Color.getColor("#1b7161"));
						String element = elements.get(i);
						outputTextArea.append(element + "\n"); // Agrega el elemento y un salto de línea
					}

					//lexer.vaciarLista();

				} catch(Exception error ) {
					outputTextArea.setForeground(Color.RED);
					outputTextArea.setText(error.getMessage());
					JOptionPane.showMessageDialog(null,  error.getMessage(), "Error de compilación", JOptionPane.ERROR_MESSAGE);
				}
			}
		});
		btnCompile.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnCompile.setBounds(484, 648, 190, 44);
		btnCompile.setCursor(new Cursor(Cursor.HAND_CURSOR));
		btnCompile.setEnabled(false);
		panel.add(btnCompile);
		
		JLabel lblNewLabel = new JLabel("Entrada");
		lblNewLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		lblNewLabel.setFont(new Font("Calibri", Font.ITALIC, 18));
		lblNewLabel.setForeground(new Color(0, 0, 0));
		lblNewLabel.setBounds(10, 10, 104, 24);
		panel.add(lblNewLabel);
		
		JLabel lblResultadoCompilacion = new JLabel("Resultado compilación");
		lblResultadoCompilacion.setVerticalAlignment(SwingConstants.BOTTOM);
		lblResultadoCompilacion.setForeground(new Color(0, 0, 0));
		lblResultadoCompilacion.setFont(new Font("Calibri", Font.ITALIC, 18));
		lblResultadoCompilacion.setBounds(484, 10, 231, 24);
		panel.add(lblResultadoCompilacion);
		
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
		btnClear.setBounds(698, 648, 190, 44);
		btnClear.setCursor(new Cursor(Cursor.HAND_CURSOR));
		panel.add(btnClear);
		
		JLabel lblNewLabel_1 = new JLabel("=");
		lblNewLabel_1.setFont(new Font("Calibri", Font.BOLD, 30));
		lblNewLabel_1.setBounds(440, 311, 15, 24);
		panel.add(lblNewLabel_1);
		
		JLabel informationLabel = new JLabel("Indicar ubicacion destino del archivo ts.txt");
		informationLabel.setFont(new Font("Calibri", Font.PLAIN, 15));
		informationLabel.setBounds(10, 641, 404, 20);
		panel.add(informationLabel);
		
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.setSelectedFile(new File("ts.txt"));
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
		exploreBtn.setBounds(329, 656, 85, 30);
		panel.add(exploreBtn);
		
		JMenuBar menuBar = new JMenuBar();
		frame.setJMenuBar(menuBar);
		
		JMenu mnNewMenu = new JMenu("Archivo");
		mnNewMenu.setBackground(new Color(192, 192, 192));
		menuBar.add(mnNewMenu);
		
		JMenuItem mntmNewMenuItem = new JMenuItem("Cargar un archivo...");
		mntmNewMenuItem.addActionListener(new ActionListener() {
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
		                    inputTextArea.append(linea);
		                }

		                bufferedReader.close();
		        	} catch (Exception error){
		        		JOptionPane.showMessageDialog(null, "Error", "Error al abrir el archivo", JOptionPane.ERROR_MESSAGE);
		        	}
		        }
			}
		});
		mntmNewMenuItem.setBackground(new Color(211, 211, 211));
		mnNewMenu.add(mntmNewMenuItem);
		
	}
}
