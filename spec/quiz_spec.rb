require File.join(File.dirname(__FILE__), '..', 'models.rb')
require 'dm-migrations'
require 'dm-aggregates'
seed = lambda {
        DataMapper.auto_migrate!
        Question.seed
}

describe Question do 
    before :all do
        seed.call
    end

    it "should get a random question from any tag" do 
       Question.random_question("rails").should_not be_nil 
    end
end

describe Taker do 
    before :all do
        seed.call
    end

    before :each do
        @user = Taker.first_or_create :uid => "10841046"
    end

    it "should be unique" do 
        u = Taker.new :uid => "10841130"
        u.save.should == true

        v = Taker.new    :uid => "10841130"
        v.save.should_not == true
    end

    it "should be a valid account" do 
        u = Taker.new :uid => "12345"
        u.save.should_not == true
    end

    it "should have questions assigned" do
        @user.questions.should_not be_nil
    end

    it "should have 5 questions" do 
        @user.questions.should have_exactly(Question::Tags.size).items
    end

    it "should have unique questions" do 
        @user.questions.sort.should == @user.questions.uniq.sort
    end

    it "should have an attached response"
end
