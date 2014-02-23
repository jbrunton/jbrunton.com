class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]

  
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:uid)).first_or_create do |user|
      user.uid = auth.uid
      user.name = auth.info.name
    end
  end
end
