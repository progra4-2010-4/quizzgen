require 'yaml'
require 'models'
task :seed do 
    yml = YAML.load_file "seeds.yml"
    yml.each_key do |k|
       puts "Creating a #{yml[k]['tag']} question"
       Question.create :tag=>yml[k]['tag'], :question=>yml[k]['question']
    end
end
