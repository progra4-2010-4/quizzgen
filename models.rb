%w{core migrations validations timestamps aggregates ar-finders}.each{|x| require "dm-#{x}"}
require 'carrierwave'

DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))


class ResponseUploader < CarrierWave::Uploader::Base
      storage :file
      def store_dir; "responses"; end
end

class Question
    include DataMapper::Resource
    Tags = ['lang', 'css', 'jquery', 'rails', 'theory']
    Seeds = Dir.entries("#{File.dirname(__FILE__)}/seeds").
                reject{|x| (x =~ /\.{1,2}/) == 0}.collect{|f| "#{File.dirname(__FILE__)}/seeds/#{f}"}

    property :id, Serial
    property :tag, String
    property :question, Text

    has n, :takers, :through => Resource

    def self.random_question(tag)
        self.find_by_sql("SELECT  `id`, `tag`, `question` FROM questions WHERE tag='#{tag}' ORDER BY RANDOM() limit 1",
                          :properties => [:id, :tag, :question])
    end
end

class Taker
    include DataMapper::Resource
    
    property :id, Serial
    property :uid, String
    property :created_at, DateTime
    property :response, String
    #also, file response
#    mount_uploader :response, ResponseUploader

    has n, :questions, :through => Resource

    validates_uniqueness_of :uid
    validates_within :uid, 
                     :set => ["10841046", "10751107", "10841069", "10841012", "10851016", "10851033", "10911203", "10911020", "10611237", "10741036", "10841130", "10841297", "10841181", "10711134", "10841264"]
    
    after :save do 
        questions = []
        q = nil
        get_question = lambda { |t| q = Question.random_question(t) }
        Question::Tags.each do |tag|
            get_question.call(tag)
            while questions.include?(q) do
                get_question.call(tag)
            end
            self.questions.concat q
        end
    end
end
