Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.production?
        provider :facebook, '466023933535908', '925fc8850ccd141d7cb39e4033f7de9c', 
                 :image_size => { :height => 75, :width => 75 }, 
                 :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}, 
                 :provider_ignores_state => true, 
                 :scope => 'email',
                 :display => 'popup'
    else
        provider :facebook, '466024056869229','e3d063df07306d87be110650d78b3d9a', 
                 :image_size => { :height => 75, :width => 75 },  
                 :provider_ignores_state => true, 
                 :scope => 'email',
                 :display => 'popup'
    end


end




 