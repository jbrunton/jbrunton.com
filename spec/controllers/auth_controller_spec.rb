require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AuthController do

  # This should return the minimal set of attributes required to create a valid
  # BlogPost. As you add validations to BlogPost, be sure to
  # adjust the attributes here as well.
  let(:admin_uid) { "123" }
  let(:valid_attributes) { { "uid" => admin_uid, "info" => { "name" => "Alice" } } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BlogPostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET facebook" do
    before do
      # for testing purposes, we have to tell Devise which mapping to use for routing
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook_admin]
    end
    
    context "if the user is an admin" do
      before { allow(User).to receive(:admin_uids).and_return([admin_uid]) }

      it "should create a new user, if none exists" do
        expect { get :facebook }.to change(User, :count).by(1)
      
        # this assertion is not strictly a requirement of the observable behavior of this controller,
        # but it allows us to write other assertions in terms of assigns(:user)
        expect(assigns(:user).uid).to eq(admin_uid)
      end
    
      it "should sign in the created user" do
        get :facebook
        expect(controller.current_user).to eq(assigns(:user))
      end
    
      it "should redirect" do
        pending
        # TODO: doesn't seem to redirect
        # expect(response).to redirect_to(assigns(:user))
      end
    
      it "should specify a message in the flash" do
        get :facebook
        expect(flash[:notice]).to eq("Successfully authenticated from Facebook account.")
      end
    
      context "if the user already exists" do
        before { create(:user, :uid => admin_uid) }
      
        it "should assign the existing user" do
          expect{ get :facebook }.to_not change(User, :count)
        end
      end
    end
  end

end
