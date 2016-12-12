module Api
  class CommonController < ApplicationController
    skip_before_action :authenticate_user!, :configure_permitted_parameters
    skip_before_action :verify_authenticity_token
    http_basic_authenticate_with name: "ram", password: "Passw00rd"
    require 'socket'

    def remote_ip
      ip = Socket.ip_address_list.detect{ |intf| intf.ipv4_private? }
      Ip.create!(ipaddress: ip.ip_address) rescue nil if ip
      render json: { ipaddress_count: Ip.count }
    end

    def ipaddress_lists
      @ipaddress = Ip.all
      render json: @ipaddress
    end

    private
    def local_ip
      if request.remote_ip == '127.0.0.1'
        # Hard coded remote address
        ipaddress = '123.45.67.89'
      else
        ipaddress = request.remote_ip
      end
      ipaddress
    end
  end
end