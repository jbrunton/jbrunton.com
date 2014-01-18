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

describe BlogPostsController do

  # This should return the minimal set of attributes required to create a valid
  # BlogPost. As you add validations to BlogPost, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BlogPostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all blog_posts as @blog_posts" do
      blog_post = BlogPost.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:blog_posts)).to eq([blog_post])
    end
    
    it "orders the blog_posts by creation date in descending order" do
      post_A = create(:blog_post, created_at: Date.today)
      post_B = create(:blog_post, created_at: 2.days.ago)
      post_C = create(:blog_post, created_at: 1.day.ago)
      
      get :index, {}, valid_session
      
      expect(assigns(:blog_posts)).to eq([post_B, post_C, post_A])
    end
  end

  describe "GET show" do
    it "assigns the requested blog_post as @blog_post" do
      blog_post = BlogPost.create! valid_attributes
      get :show, {:id => blog_post.to_param}, valid_session
      expect(assigns(:blog_post)).to eq(blog_post)
    end
  end

  describe "GET new" do
    it "assigns a new blog_post as @blog_post" do
      get :new, {}, valid_session
      expect(assigns(:blog_post)).to be_a_new(BlogPost)
    end
  end

  describe "GET edit" do
    it "assigns the requested blog_post as @blog_post" do
      blog_post = BlogPost.create! valid_attributes
      get :edit, {:id => blog_post.to_param}, valid_session
      expect(assigns(:blog_post)).to eq(blog_post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BlogPost" do
        expect {
          post :create, {:blog_post => valid_attributes}, valid_session
        }.to change(BlogPost, :count).by(1)
      end

      it "assigns a newly created blog_post as @blog_post" do
        post :create, {:blog_post => valid_attributes}, valid_session
        expect(assigns(:blog_post)).to be_a(BlogPost)
        expect(assigns(:blog_post)).to be_persisted
      end

      it "redirects to the created blog_post" do
        post :create, {:blog_post => valid_attributes}, valid_session
        expect(response).to redirect_to(BlogPost.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blog_post as @blog_post" do
        # Trigger the behavior that occurs when invalid params are submitted
        BlogPost.any_instance.stub(:save).and_return(false)
        post :create, {:blog_post => { "title" => "invalid value" }}, valid_session
        expect(assigns(:blog_post)).to be_a_new(BlogPost)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BlogPost.any_instance.stub(:save).and_return(false)
        post :create, {:blog_post => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested blog_post" do
        blog_post = BlogPost.create! valid_attributes
        # Assuming there are no other blog_posts in the database, this
        # specifies that the BlogPost created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(BlogPost).to receive(:update).with({ "title" => "MyString" })
        put :update, {:id => blog_post.to_param, :blog_post => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested blog_post as @blog_post" do
        blog_post = BlogPost.create! valid_attributes
        put :update, {:id => blog_post.to_param, :blog_post => valid_attributes}, valid_session
        expect(assigns(:blog_post)).to eq(blog_post)
      end

      it "redirects to the blog_post" do
        blog_post = BlogPost.create! valid_attributes
        put :update, {:id => blog_post.to_param, :blog_post => valid_attributes}, valid_session
        expect(response).to redirect_to(blog_post)
      end
    end

    describe "with invalid params" do
      it "assigns the blog_post as @blog_post" do
        blog_post = BlogPost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BlogPost.any_instance.stub(:save).and_return(false)
        put :update, {:id => blog_post.to_param, :blog_post => { "title" => "invalid value" }}, valid_session
        expect(assigns(:blog_post)).to eq(blog_post)
      end

      it "re-renders the 'edit' template" do
        blog_post = BlogPost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BlogPost.any_instance.stub(:save).and_return(false)
        put :update, {:id => blog_post.to_param, :blog_post => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested blog_post" do
      blog_post = BlogPost.create! valid_attributes
      expect {
        delete :destroy, {:id => blog_post.to_param}, valid_session
      }.to change(BlogPost, :count).by(-1)
    end

    it "redirects to the blog_posts list" do
      blog_post = BlogPost.create! valid_attributes
      delete :destroy, {:id => blog_post.to_param}, valid_session
      expect(response).to redirect_to(blog_posts_url)
    end
  end

end
