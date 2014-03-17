require 'spec_helper'
require 'cancan'

describe ApplicationController do
  
  controller do
    def access_denied
      raise CanCan::AccessDenied
    end
  end

  before do
    @routes.draw do
      get '/anonymous/access_denied'
    end
  end

  it 'redirects to the root when access is denied' do
    get :access_denied
    expect(response).to redirect_to(root_path)
  end

  it 'sets a flash alert when access is denied' do
    get :access_denied
    expect(flash.alert).to match(/not authorized/)
  end

end
