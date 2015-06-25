$client = SoundCloud.new(client_id: ENV["SOUNDCLOUD_CLIENT_ID"],
                          client_secret: ENV["SOUNDCLOUD_CLIENT_SECRET"],
                          redirect_uri: "http://localhost:4000/callback")
