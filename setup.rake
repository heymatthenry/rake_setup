desc "Setup a new Rails application"
namespace :setup do
  namespace :plugins do
    desc "Install Shoulda, shoulda_generator, and Factory Girl"
    task :shoulda do      
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/shoulda")
        sh('script/plugin install git://github.com/thoughtbot/shoulda.git')
      end
      unless File.exist?(File.dirname(__FILE__) + "/../../shoulda_generator")
        sh('script/plugin install git://github.com/technicalpickles/shoulda_generator.git') 
      end
      unless File.exist?(File.dirname(__FILE__) + "/../../factory_girl")
        sh('script/plugin install git://github.com/thoughtbot/factory_girl.git') 
      end
    end
  end
end
