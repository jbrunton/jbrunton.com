class User < ActiveRecord::Base
  rolify
  devise :omniauthable, :omniauth_providers => [:facebook]

  
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:uid)).first_or_create do |user|
      user.uid = auth.uid
      user.name = auth.info.name
    end
  end
  
  def self.admin_uids
    ENV['admin_users']
      .split(',')
      .map{ |s| s.strip }
  end
  
  def apply_roles
    if User.admin_uids.include?(uid)
      add_role :admin
    else
      remove_role :admin
    end
  end
  
  def admin?
    has_role? :admin
  end
end
