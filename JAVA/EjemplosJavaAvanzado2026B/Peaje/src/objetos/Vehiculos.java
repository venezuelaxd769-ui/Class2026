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
    
    private int id;
    private String tipoVehiculo;
    private int valor;

    public Vehiculos(int id, String tipoVehiculo, int valor) {
        this.id = id;
        this.tipoVehiculo = tipoVehiculo;
        this.valor = valor;
    }

    public int getId() {
        return id;
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
