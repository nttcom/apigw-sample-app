## Sample App[ClientApp] for Business Process API via NTT Communications API Gateway 
Sample app[ClientApp] for Business Process API  
  Business Process API spec is [here](https://developer.ntt.com/ja/apidocs/CPTF/business-process/business-process).

## Building Prerequisites
  * Node.js (0.12.x)
    * CoffeeScript
    * Yo
    * Bower
    * Grunt
  * Ruby (2.1.x)
    * Compass
    * Haml
  
## Quick Installation, Build, Deploy
  This building on Mac OSX 10.10.3

    #node.js install
	$ brew install node
	
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

    #module install
	$ npm install -g coffeescript yo bower grunt-cli
	$ gem install compass haml
	
	#sample-clientapp install
	$ cd /path/to/ClientApp
	$ npm install
	$ bower install
	  * if you have this bellow messages, you should select item required by nttcom-api-gateway-webapp
	
	Unable to find a suitable version for angular, please choose one:
	
	$ node generate_encryption_key.js	
	bytes key:

	* you should config bytes key value to access_token_decryption_key.coffee.
	* you should config Base64 key to sample auth serverapp.
	
	app/scripts/services/api/access_token_decryption_key.coffee
	.constant 'accessTokenDecryptionKey',

	#config for urls
	$ vim app/scripts/services/api/api_settings.coffee
	* you should config auth_url that you set sample auth serverapp.
	----

	#build


## Next Action
  You shoul install and config [sample app(AuthServer)](https://github.com/nttcom/apigw-sample-app/tree/master/ServerApp).
  	
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