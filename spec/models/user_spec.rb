require 'spec_helper'

describe User do
  let(:auth) { build(:auth_hash, info_name: 'Jeff Goldblum') }
  let(:user) { User.find_for_facebook_oauth(auth) }
  
  describe ".find_for_facebook_oauth" do
    context "if the user doesn't already exist" do
      it "creates a new user based on the hash" do
        expect{ user }.to change(User, :count).by(1)
      end
      
      it "assigns the user's name from the hash" do
        expect(user.name).to eq(auth.info.name)
      end
    end
    
    context "if the user already exists" do
      before { @expected_user = create(:user, :uid => auth.uid) }
      
      it "returns the existing user" do
        expect(user).to eq(@expected_user)
      end
    end
  end
end
