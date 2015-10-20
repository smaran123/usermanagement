OmniAuth.config.logger = Rails.logger

#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, '476351172505751', 'f7ff05eb33d24496d8ee45fad7119915', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
#end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '476351172505751', 'f7ff05eb33d24496d8ee45fad7119915', {:provider_ignores_state => true}
end
