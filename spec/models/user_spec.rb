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
  
  describe ".admin_users" do
    it "returns a list of admin uids based on the ADMIN_USERS environment variable" do
      expect(ENV).to receive('[]').with('ADMIN_USERS').and_return("123, 456")
      admin_uids = User.admin_uids
      expect(admin_uids).to include("123")
      expect(admin_uids).to include("456")
    end
  end
  
  describe "#admin?" do
    before { allow(User).to receive(:admin_uids).and_return(["123"]) }

    it "returns true if the uid is listed in ADMIN_USERS" do
      user.uid = "123"
      expect(user.admin?).to eq(true)
    end

    it "returns false otherwise" do
      user.uid = "456"
      expect(user.admin?).to eq(false)
    end
  end
end
