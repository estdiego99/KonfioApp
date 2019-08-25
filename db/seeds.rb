# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

route = File.join(Rails.root, 'public', 'files', 'facturas.csv')
facturas_vanilla = CSV.read(route, encoding: "ISO-8859-1:UTF-8")

Bill.delete_all
Product.delete_all
Business.delete_all

facturas_vanilla[1..2000].each do |factura|
    rfc = factura[0]
    uuid = factura[1]
    ccyisocode = factura[2]
    ccyfx = factura[3]
    payment_method = factura[4]
    payment_type = factura[5]
    subtotal = factura[6]
    total = factura[7]
    placegenerated = factura[8]
    date = factura[9]
    receptor_rfc = factura[10]
    receptor_name = factura[11]
    emisor_rfc = factura[12]
    emisor_name = factura[13]
    vigente = factura[14]
    product_id = factura[15]
    quantity = factura[16]
    cost = factura[17]

    if (Product.where(:product_id => product_id).empty?)
        @product = Product.new
        @product.product_id = product_id
        @product.cost = cost
        @product.save!
    end

    if (Business.where(:rfc => receptor_rfc).empty?)
        @business = Business.new
        @business.rfc = receptor_rfc
        @business.name = receptor_name
        @business.save!
    end

    if (Business.where(:rfc => emisor_rfc).empty?)
        @business_emi = Business.new
        @business_emi.rfc = emisor_rfc
        @business_emi.name = emisor_name
        @business_emi.save!
    end

    if (Bill.where(:uuid => uuid).empty?)
        @bill = Bill.new
        @bill.rfc = rfc
        @bill.uuid = uuid
        @bill.ccyisocode = ccyisocode
        @bill.subtotal = subtotal
        @bill.place_generated = placegenerated
        @bill.date = date
        @bill.vigente = (vigente == "Vigente")
        @bill.quantity = quantity
        @bill.product_id = product_id
        @bill.emisor_rfc = emisor_rfc
        @bill.receptor_rfc = receptor_rfc
        @bill.cost = cost;
        @bill.venta = (rfc == emisor_rfc)
        @bill.save!
    end
end
