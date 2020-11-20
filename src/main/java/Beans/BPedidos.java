package Beans;

import java.sql.Time;
import java.util.Date;

public class BPedidos {
    private String codigoPedido;
    private Date fechaEntrega;
    private Time horaRecojo;
    private String estado;
    private double monto;
    private String cliente_dni;

    public String getCodigoPedido() {
        return codigoPedido;
    }

    public void setCodigoPedido(String codigoPedido) {
        this.codigoPedido = codigoPedido;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public Time getHoraRecojo() {
        return horaRecojo;
    }

    public void setHoraRecojo(Time horaRecojo) {
        this.horaRecojo = horaRecojo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getCliente_dni() {
        return cliente_dni;
    }

    public void setCliente_dni(String cliente_dni) {
        this.cliente_dni = cliente_dni;
    }
}
