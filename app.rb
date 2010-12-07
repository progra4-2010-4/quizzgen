require 'sinatra/base'
require 'dm-core'
require 'dm-migrations'
require 'haml'
require 'models'

class Quizzly < Sinatra::Base
    
    enable :session

    configure do
        #DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))
        DataMapper.auto_migrate!
        yml = YAML.load_file "seeds.yml"
        yml.each_key do |k|
           Question.create :tag=>yml[k]['tag'], :question=>yml[k]['question']
        end
    end

    get '/' do 
        Question.all.inspect 
    end
   
end
