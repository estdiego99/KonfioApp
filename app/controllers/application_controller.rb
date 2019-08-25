class ApplicationController < ActionController::Base
    helper_method :current_business

    def current_business
        current = Business.find(Bill.first.rfc)
    end
end
