class Bill < ApplicationRecord

    def business
        Business.find(rfc)
    end

    def business_name
        Business.find(rfc).name
    end

    def ccyfx
        if "MXN"
            1
        elsif "USD"
            20
        end
    end

    def venta
        (rfc == emisor_rfc)
    end

    def product
        Product.find(product_id)
    end

    def subtotal
        cost*quantity
    end

    def total
        subtotal*1.16
    end

    def emisor
        Business.find(emisor_rfc)
    end

    def emisor_name
        emisor.name
    end

    def receptor
        Business.find(receptor_rfc)
    end

    def receptor_name
        receptor.name
    end
end
