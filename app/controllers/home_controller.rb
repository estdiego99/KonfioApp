class HomeController < ApplicationController
    def index 
        @bills = Bill.all
    end
    def ventas
    end
    def compras
    end

end
