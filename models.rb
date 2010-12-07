require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))

class Question
    include DataMapper::Resource

    property :id, Serial
    property :tag, String
    property :question, Text
end

DataMapper.auto_upgrade!
