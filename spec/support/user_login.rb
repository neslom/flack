require "oauth2"

def login_with_soundcloud
  client_id = ENV["SOUNDCLOUD_CLIENT_ID"]
  client_secret = ENV["SOUNDCLOUD_CLIENT_SECRET"]
  redirect_uri = $client.redirect_uri
  site = "http://localhost:4000"

  client = OAuth2::Client.new(client_id, client_secret, site: site)
  access_token = client.secret

  user = User.create(name: "markus",
                     access_token: access_token)

  current_user = allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  return user
end
