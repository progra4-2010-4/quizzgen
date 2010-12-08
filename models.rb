%w{core migrations validations timestamps aggregates}.each{|x| require "dm-#{x}"}
require 'carrierwave'

DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))

class ResponseUploader < CarrierWave::Uploader::Base
      storage :file
      def store_dir; "responses"; end
end

class Question
    include DataMapper::Resource
    Tags = ['lang', 'css', 'jquery', 'rails', 'theory']

    property :id, Serial
    property :tag, String
    property :question, Text

    has n, :takers, :through => Resource
end

class Taker
    include DataMapper::Resource
    
    property :id, Serial
    property :uid, String
    property :created_at, DateTime
    property :response, String
    #also, file response
    mount_uploader :response, ResponseUploader

    has n, :questions, :through => Resource

    validates_uniqueness_of :uid
    validates_within :uid, :valid_taker,
                     :set => ["10841046", "10751107", "10841069", "10841012", "10851016", "10851033", "10911203", "10911020", "10611237", "10741036", "10841130", "10841297", "10841181", "10711134", "10841264"]

    after :save do 
        questions = []
        q = nil
        get_question = lambda { q = Question.get(1+rand(Question.count)) }
        5.times do 
            get_question.call
            while questions.include?(q) do
                get_question.call
            end
            self.questions << q
        end
    end
end
