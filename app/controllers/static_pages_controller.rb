class StaticPagesController < ApplicationController
    def home
    end
  
    def help
    end
  
    def about
    end
  
    def contact
    end
    
    require 'rest-client' 
    require 'net/http'
    def make
        url = 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'

        uri = URI(url)
          
        response = Net::HTTP.get(uri)
        render json: JSON.parse(response)
    #   response = RestClient::Request.execute(
    #   method: :get,
    #   url: 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'
    #   )          
    #   return JSON.parse(response)         
    end

  end
  