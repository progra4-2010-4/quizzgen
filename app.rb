require 'sinatra/base'
require 'dm-core'
require 'dm-migrations'
require 'haml'
require 'models'

class Quizzly < Sinatra::Base
    
    enable :session
=begin    
    configure do
         DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))
         DataMapper.auto_upgrade!
    end
=end

    get '/' do 
        Question.all.inspect 
    end
   
end
