class HomeController < ApplicationController
    def index 
        @bills = Bill.all

        @ventas = current_business.ventas.sort_by(&:total)
        @compras = current_business.compras.sort_by(&:total)
        @clientes = current_business.clientes
        @proveedores = current_business.proveedores

        @ventas_total = 0
        @ventas.each do |factura|
            @ventas_total += factura.total
        end
        @ventas_total.round(2)

        @compras_total = 0
        @compras.each do |factura|
            @compras_total += factura.total
        end
        @compras_total.round(2)
    end

    def ventas
        @ventas = current_business.ventas.sort_by(&:total)
        @clientes = current_business.clientes
        @ventas_total = 0
        @ventas.each do |factura|
            @ventas_total += factura.total
        end
        @ventas_total.round(2)
    end

    def compras
        @compras = current_business.compras.sort_by(&:total)
        @proveedores = current_business.proveedores
        @compras_total = 0
        @compras.each do |factura|
            @compras_total += factura.total
        end
        @compras_total.round(2)
    end

end
