module Api
  class CommonController < ApplicationController
    skip_before_action :authenticate_user!, :configure_permitted_parameters
    skip_before_action :verify_authenticity_token
    http_basic_authenticate_with name: "ram", password: "Passw00rd"

    def remote_ip
      if request.remote_ip == '127.0.0.1'
        # Hard coded remote address
        ipaddress = '123.45.67.89'
      else
        ipaddress = request.remote_ip
      end
      Ip.create!(ipaddress: ipaddress) rescue nil
      render json: { ipaddress_count: Ip.count }
    end

    def ipaddress_lists
      @ipaddress = Ip.all
      render json: @ipaddress
    end
  end
end