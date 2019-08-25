class Business < ApplicationRecord
    
    def bills
        Bill.where(rfc: rfc)
    end

    def ventas
        @ventas = []
        bills.each do |factura|
            if (factura.venta)
                @ventas.push(factura)
            end
        end
    end

    def compras
        @compras = []
        bills.each do |factura|
            if (!factura.venta)
                @compras.push(factura)
            end
        end
    end

    def ventas_subtotal
        @acumulado = 0
        ventas.each do |factura|
            @acumulado += factura.subtotal
        end
        @acumulado.round(2)
    end

    def ventas_total
        @acumulado = 0
        ventas.each do |factura|
            @acumulado += factura.total
        end
        @acumulado.round(2)
    end

    def products
        Product.where(:bills.product_id => product_id, :bill.venta => "true")
    end

    def clientes

    end

    def mejores_clientes

    end
end
