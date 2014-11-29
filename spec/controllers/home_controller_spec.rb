require 'spec_helper'

describe HomeController, :type => :controller do

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      expect(response).to be_success
    end
  end

end
