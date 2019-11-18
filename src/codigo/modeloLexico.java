/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

/**
 *
 * @author gugj9
 */
public class modeloLexico {
    private String lexema;
    private String token;
    private int linea;

    public modeloLexico(String lexema, String token, int linea) {
        this.lexema = lexema;
        this.token = token;
        this.linea=linea;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
    public int getLinea(){
        return linea;
    }
    public void setLinea(){
        this.linea=linea;
    }
    
}
