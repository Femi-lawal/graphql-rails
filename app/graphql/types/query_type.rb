module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"   
    def test_field
      "Hello World!"
    end

    field :calculate_price, String, null: false, 
    description: "An example field added by the generator" do
      argument :type, String, required: true
      argument :margin, Float, required: true
      argument :exchangerate, Float, required: true
    end  

    require 'net/http'
    require 'rest-client' 
    def calculate_price (type:, margin:, exchangerate:)
      url = 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'

      uri = URI(url) 
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)  
      price = data['bpi']['USD']['rate_float']
      margin_price = price * margin    
      final_value = 0   
      if (type == 'sell')
        final_value = price - margin
      end
      if (type == 'buy')
        final_value = price + margin
      end
      result = final_value * exchangerate      
      if (type != 'buy' && type != 'sell')
        result = 'provide a valid value for type'
      end
      result
    end

    # field :cc, Types::BtType do 
    #   description "the value"
    #   resolve -> (obj, args, ctx){}
    # end
 
  end
end
