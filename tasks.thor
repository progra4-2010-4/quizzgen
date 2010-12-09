require 'mustache'
require 'models'
require 'dm-migrations'
require 'git'

class Generate < Thor
    include Thor::Actions

    desc "database", "Re-creates the database from scratch"
    def database 
        DataMapper.auto_migrate!
        Question.seed
    end

    desc "quizzes --test", "Generate quizzes"
    method_options :test => :boolean
    def quizzes
        invoke :database

        Mustache.template_file = File.dirname(__FILE__) + 'templates/quiz.mustache'
        
        Taker::Takers.each do |student| 
            quiz = Mustache.new
            t = Taker.create :uid
            quiz[:student]   = t.uid
            quiz[:questions] = t.questions

            quizzes_dir = options.test? ? "test_quizzes" : "quizzes"
            quizz_name  = "#{quizzes_dir}/#{t.uid}/examen.html" 
            say "Creating quiz #{quizz_name}"
            repo = git.init File.join(quizzes_dir, t.uid)
            f = File.open(quizz_name, w).write(quiz.render)
            repo.add quizz_name
            repo.add_remote "origin", "git@lfborjas.xen.prgmr.com:#{t.uid}_examen3.git"
            repo.commit "Quiz generado automáticamente"
            repo.push unless options.test?
        end
    end
end
