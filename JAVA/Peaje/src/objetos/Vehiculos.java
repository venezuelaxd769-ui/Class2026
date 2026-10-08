/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;

/**
 *
 * @author cymaniatico
 */
public class Vehiculos {
    
    private String tipoVehiculo;
    private int valor;

    public Vehiculos(String tipoVehiculo, int valor) {
        this.tipoVehiculo = tipoVehiculo;
        this.valor = valor;
    }

    public String getTipoVehiculo() {
        return tipoVehiculo;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
    
    
    
}
