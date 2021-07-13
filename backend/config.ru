require 'rack/cors'
# require_relative "./config/environment.rb"
require './config/environment'

use Rack::JSONBodyParser
run ApplicationController

# use Rack::Cors do

#     allow do
#         origins '*'
#         resource '/*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options]  
#     end
# end

# run Application.new
