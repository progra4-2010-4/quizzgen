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
        Question::Seeds.each do |seed|
            yml = YAML.load_file seed 
            yml.each_key do |k|
               Question.create :tag=>yml[k]['tag'], :question=>yml[k]['question']
            end
        end
    end

    helpers do 
        def started?
            !!session[:taker]
        end

        def taker 
            session[:taker]
        end
    end
    
    before do 
        if session[:ended]
            halt "Ya se terminó el examen, buscá que hacer"
        end
    end

    get '/' do 
        @questions = started? ? taker.questions : []
        haml :questions
    end
   

    get '/ledashboard' do 
        @takers = Taker.all
        haml :dashboard
    end

    post '/start' do 
        t = Taker.new :uid => params[:uid]
        if t.save then "OK" else "not ok!" end
    end

    post '/end' do 
        #associate the upload to the taker and kill his session
        session[:ended] = true
        "OK"
    end
end
