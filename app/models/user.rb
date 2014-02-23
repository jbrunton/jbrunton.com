class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]

  
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:uid)).first_or_create do |user|
      user.uid = auth.uid
      user.name = auth.info.name
    end
  end
  
  def self.admin_uids
    ENV['ADMIN_USERS'].to_s
      .split(',')
      .map{ |s| s.strip }
  end
  
  def admin?
    User.admin_uids.include?(uid.to_s)
  end
end
