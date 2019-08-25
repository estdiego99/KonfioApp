class Business < ApplicationRecord
    
    def bills
        Business.where(rfc: rfc)
    end

    def ventas
        bills.where(:venta => "true")
    end

    def compras
        bills.where(:venta => "false")
    end

    def products
        Product.where(:bills.product_id => product_id, :bill.venta => "true")
    end

    def clientes

    end

    def mejores_clientes

    end
end
