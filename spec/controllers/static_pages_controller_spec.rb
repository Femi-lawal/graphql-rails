require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
    describe "GET StaticPages#make" do
        it "returns json response" do
            parse_json = response
            parse_json['bpi']['USD']['description'].should == "United States Dollar"
        end
    end


    describe "GET #okay" do
        it "returns json response" do
            parse_json = JSON(response.body)
            parse_json["success"].should == true            
        end
    end    
end