## Sample App[AuthServer] for Business Process API via NTT Communications API Gateway 
Sample app[AuthServer] for Business Process API  
  Business Process API spec is [here](https://developer.ntt.com/ja/apidocs/CPTF/business-process/business-process).

## Building Prerequisites
  * Ruby (2.2.*)
    * Bundler
  * Installed [Sample clientapp](https://github.com/nttcom/apigw-sample-app/tree/master/ClientApp)
  
## Quick Installation, Config, Deploy, Demo
  This building on CentOS6.x
	
	#rvm insall
	#https://rvm.io/
	$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	$ \curl -sSL https://get.rvm.io | bash -s stable
	$ echo source ~/.profile >> ~/.bash_profile
	$ rvm list known
	$ rvm install ruby-2.2
	$ which ruby
	   ~/.rvm/rubies/ruby-2.2.1/bin/ruby
	$ which gem
       ~/.rvm/rubies/ruby-2.2.1/bin/gem
    
    #Bundler install
    $ gem install bundler --no-document
	
	#sample-auth serverapp install
	$ cd /path/to/ServerApp
	$ bundle install --without development test --path vendor/bundle

    #assets precompile
    $ bundle exec rake assets:precompile
	
	#config
	$ cp config/settings.local.yml.sample config/settings.local.yml
    $ vim config/settings.local.yml
    ---
    apigw_keys_default:
      consumer_key: 'CONSUMER_KEY for Business Prcoess API'
      secret_key: 'SECRET_KEY for Business Process API'
    access_token_encryption_key:
    'Base64 key by executing node generate_encryption_key.js'

    webapp:
      url: 'http://apigw-sample-clientapp-FQDN/apigw'
    ---
      Notice: 
      * CONSUMER_KEY/SECRET_KEY is
      https://developer.ntt.com/ja/apidocs/CPTF/business-process/oauth
      * Base 64 key is
      https://github.com/nttcom/apigw-sample-clientapp
	#config for encrition
	* you should config bytes key value to access_token_decryption_key.coffee.
	* you should config Base64 key to sample auth serverapp.
	
	#set env
	$ bundle exec rake secret
	  RANDOM_STRINGS
	$ export SECRET_KEY_BASE='RANDOM_STRINGS'

    #set SNS Apps config
    #Twitter Apps
    #https://apps.twitter.com/
    #config callback url
    http(s)://apigw-sample-severapp-FQDN/auth/twitter/callback
    
    #Facebook Apps
    #https://developers.facebook.com/
    http(s)://apigw-sample-severapp-FQDN
    
    #config SNS Login setting
    $ vim config/settings.local.yml
    ----
    # Twitter App auth info
    twitter:
      consumer_key: 'Twitter App Consumer Key (API Key) '
      consumer_secret: 'Twitter Consumer Secret (API Secret) '
    # Facebook App auth info
    facebook:
      app_id: 'Facebook App ID'
      app_secret: 'Facebook App Secret'

	#puma execute	$ bundle exec puma -e production -C config/puma.rb
	#nginx install	sudo yum install epel-release -y
    sudo yum install nginx -y
    sudo service nginx start
    
    #nginx config
    ----
    upstream demo-auth {
      server unix:/app/demo/tmp/puma.socket;
    }
    server {
      listen       80;
      server_name  apigw-sample-severapp-FQDN;
      
      location ^~ / {
        alias /app/demo/public;
        try_files $uri @apigw;
      }
      location /assets/ {
        alias /path/ServerApp/public/assets/;
      }
      location @apigw {
      if (-f $request_filename) { break; }
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_pass http://demo-auth;
      }
    }

    #nginx restart
    sudo service nginx restart	    #check sample app with Google Chrome, Firefox, Safari
    http(s)://apigw-sample-severapp-FQDN
    
  	
## Features
  * View NTT Com GSS Services contract info
  * View NTT Com GSS Services service order info
  * View NTT Com GSS Services tickets info
  * Responsive UI/UX
  * [angularJS](https://angularjs.org/)

## Docs & Info
  * [Sample App Guideline](https://github.com/nttcom/apigw-sample-app/demo_app_manual_ja.pdf)
  * [NTT Com Developer Portal](https://developer.ntt.com/)
  * [NTT Communiations API Gateway Video](https://www.youtube.com/watch?v=jaRyr8TqFH4)

## Contributing

1.Fork it  
2.Create your feature branch (`git checkout -b my-new-feature`)  
3.Commit your changes (`git commit -am 'Add some feature'`)  
4.Push to the branch (`git push origin my-new-feature`)  
5.Create new Pull Request

## License
  Copyright &copy; 2015 NTT Communications Corportation  
  [Apache License, Version 2.0][Apache]

[Apache]: http://www.apache.org/licenses/LICENSE-2.0  