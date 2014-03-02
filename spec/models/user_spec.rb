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
  
  describe ".admin_uids" do
    it "returns a list of admin uids based on the admin_users environment variable" do
      expect(ENV).to receive('[]').with('admin_users').and_return("123, 456")
      admin_uids = User.admin_uids
      expect(admin_uids).to include("123")
      expect(admin_uids).to include("456")
    end
  end
  
  describe "#apply_roles" do
    context "if the uid is listed in admin_users" do
      before { allow(User).to receive(:admin_uids).and_return([user.uid]) }
      
      it "makes the user an admin" do
        expect(user).to receive(:add_role).with(:admin)
        user.apply_roles
      end
    end
    
    context "if the uid isn't listed in admin_users" do
      before { allow(User).to receive(:admin_uids).and_return([]) }

      it "doesn't make the user an admin" do
        expect(user).to_not receive(:add_role)
        user.apply_roles
      end
    end
  end
  
  describe "#admin?" do  
    context "if the user has the :admin role" do
      before { user.add_role(:admin) }
      
      it "returns true" do
        expect(user.admin?).to eq(true)
      end
    end
    
    context "if the user doesn't have the :admin role" do
      it "returns false" do
        expect(user.admin?).to eq(false)
      end
    end
  end
end
