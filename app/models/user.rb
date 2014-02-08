class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]
end
