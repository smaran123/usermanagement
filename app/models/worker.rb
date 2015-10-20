class Worker < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |worker|
      worker.provider = auth.provider 
      worker.uid  = auth.uid
      worker.name = auth.info.name
     # user.oauth_token = auth.credentials.token
      worker.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
      worker.save
    end
  end 
end
