class User < ActiveRecord::Base
  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider], uid: auth_hash[:uid], name: auth_hash[:info][:name], scope: 'playlist-read-private user-read-private user-read-email')
  end
end
