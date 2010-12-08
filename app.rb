require 'sinatra/base'
require 'dm-core'
require 'dm-migrations'
require 'haml'
require 'models'

class Quizzly < Sinatra::Base
    
    enable :sessions

    configure do
        #DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))
        DataMapper.auto_migrate!
        Question.seed
    end

    helpers do 
        def started?
            !!session[:taker]
        end

        def taker 
            Taker.find session[:taker]
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
        if t.save then session[:taker] = t.id; "OK" else "not ok!" end
        
    end

    post '/end' do 
        #associate the upload to the taker and kill his session
        session[:ended] = true
        "OK"
    end
end
