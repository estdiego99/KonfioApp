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

        @column_data = Bill.group(:venta).group_by_week(:date).sum(:subtotal)
    end

    def ventas
        @ventas = current_business.ventas.sort_by(&:total).reverse
        @clientes = current_business.clientes
        @ventas_total = 0
        @ventas_subtotal = 0
        @ventas.each do |factura|
            @ventas_total += factura.total
            @ventas_subtotal += factura.subtotal
        end
        @ventas_total.round(2)

        @iva_cobrado = @ventas_total - @ventas_subtotal
        @column_data = Bill.where(venta: 'true').group_by_week(:date).sum(:subtotal)

        @mejores_clientes = mejores_clientes(@ventas, @clientes)
        logger.debug(@mejores_clientes)

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

    def mejores_clientes(ventas,clientes)
        @h = Bill.group(:receptor_rfc).sum(:subtotal)
        logger.debug(@h)
        @h.sort_by {|k , v | v }.reverse
        @h
    end
end
