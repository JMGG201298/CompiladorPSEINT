/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.awt.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.annotation.processing.Filer;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author gugj9
 */
public class frmPrincipal extends javax.swing.JFrame {

    /**
     * Creates new form frmPrincipal
     */
    DefaultTableModel modelo;
    ArrayList<modeloLexico> listaTokens;
    Object[] o=new Object[3];
    public frmPrincipal() {
        initComponents();
        listaTokens=new ArrayList<>();
        modelo=(DefaultTableModel) tbTokens.getModel();
    }
    private void analizarLexico() throws IOException{
         int cont = 1;
        
        String expr = (String) txtEntrada.getText();
        Lexer lexer = new Lexer(new StringReader(expr));
        String resultado = "LINEA " + cont + "\t\tSIMBOLO\n";
        while (true) {
            Tokens token = lexer.yylex();
            if (token == null) {
                
                return;
            }
            switch (token) {
                case SL:
                    listaTokens.add(new modeloLexico("\\n", token.toString(), cont));
                    cont++;
                    break;
                default:
                    listaTokens.add(new modeloLexico(lexer.lexeme, token.toString(),cont));
                    break;
            }
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnAnalizar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tbTokens = new javax.swing.JTable();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtEntrada = new javax.swing.JTextArea();
        btnAL = new javax.swing.JButton();
        btnAS = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtVerificacion = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        btnAnalizar.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnAnalizar.setText("Abrir Archivo");
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        tbTokens.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Linea", "Lexema", "Token"
            }
        ));
        jScrollPane2.setViewportView(tbTokens);

        txtEntrada.setColumns(20);
        txtEntrada.setRows(5);
        jScrollPane3.setViewportView(txtEntrada);

        btnAL.setText("Analisis Lexico");
        btnAL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnALActionPerformed(evt);
            }
        });

        btnAS.setText("Analisis Sintactico");
        btnAS.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnASActionPerformed(evt);
            }
        });

        txtVerificacion.setColumns(20);
        txtVerificacion.setRows(5);
        jScrollPane1.setViewportView(txtVerificacion);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addComponent(btnAnalizar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnAL)
                        .addGap(80, 80, 80)
                        .addComponent(btnAS)
                        .addGap(42, 42, 42))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 217, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAnalizar)
                    .addComponent(btnAL)
                    .addComponent(btnAS))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 314, Short.MAX_VALUE)
                    .addComponent(jScrollPane3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        // TODO add your handling code here:

//        File archivo = new File("archivo.txt");
//        PrintWriter escribir;
//        try {
//            escribir = new PrintWriter(archivo);
//            escribir.print(txtEntrada.getText());
//            escribir.close();
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(frmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
//        }
        JFileChooser chooser=new JFileChooser();
        chooser.showOpenDialog(null);
        File archivo=new File(chooser.getSelectedFile().getAbsolutePath());

        try {
            String ST=new String(Files.readAllBytes(archivo.toPath()));
            txtEntrada.setText(ST);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(frmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(frmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }//GEN-LAST:event_btnAnalizarActionPerformed

    private void btnALActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnALActionPerformed
        try {
            analizarLexico();
            for (int i = 0; i < listaTokens.size(); i++) {
                o[0]= listaTokens.get(i).getLinea();
                o[1]= listaTokens.get(i).getLexema();
                o[2]=listaTokens.get(i).getToken();
                modelo.addRow(o);
            }
            
        } catch (IOException ex) {
            Logger.getLogger(frmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnALActionPerformed

    private void btnASActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnASActionPerformed
        String ST =txtEntrada.getText();
        Sintax s=new Sintax(new codigo.LexerCup(new StringReader(ST)));
        
        try {
            s.parse();
            
           txtVerificacion.setText("Analisis realizado correctamente");
           txtVerificacion.setForeground(new Color(25,111,62));
        } catch (Exception e) {
            Symbol sym=s.getS();
            txtVerificacion.setText("Error de Sintaxis. Linea: "+(sym.right)+" Columna: "+(sym.left)+" Texto: \""+sym.value+"\"");
           txtVerificacion.setForeground(Color.red);
        }
    }//GEN-LAST:event_btnASActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAL;
    private javax.swing.JButton btnAS;
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable tbTokens;
    private javax.swing.JTextArea txtEntrada;
    private javax.swing.JTextArea txtVerificacion;
    // End of variables declaration//GEN-END:variables
}