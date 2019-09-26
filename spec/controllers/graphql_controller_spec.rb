require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
    
    describe "GET graphql#execute" do
        it "returns json response" do
            parse_json = JSON(response.body)
            parse_json["success"].should == true
        end
    end
end
