class User < ActiveRecord::Base
  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider], uid: auth_hash[:uid], name: auth_hash[:uid], scope: 'playlist-read-private user-read-private user-read-email')
  end
end
