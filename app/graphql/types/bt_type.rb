module Types
  BtType = GraphQl::ObjectType.define do
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    name "bt"
    description "a bt"

    field :type, String
    field :margin, Float
    field :exhangerate, Float


    url = 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'

    uri = URI(url)
    ENV['HTTP_PROXY'] = 'http://christian.ironuma:Abuja128@10.100.21.9:8080' 
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)  
    price = data['bpi']['USD']['rate'] 
    
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"   
    def test_field
      "Hello World!"
    end

    field :calculate_price, String, null: false,
    description: "An example field added by the generator"  
    
    require 'net/http'
    require 'rest-client' 
    def calculate_price
      url = 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'

      uri = URI(url)
      ENV['HTTP_PROXY'] = 'http://christian.ironuma:Abuja128@10.100.21.9:8080' 
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)  
      data['bpi']['USD']['rate']       
    end
 
  end
end
