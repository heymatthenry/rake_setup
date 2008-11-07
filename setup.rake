desc "Setup a new Rails application"
namespace :setup do   
  desc "Install commonly used plugins"
  namespace :plugins do
        
    desc "Install Shoulda, shoulda_generator, and Factory Girl" 
    task :shoulda do
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/shoulda")
        sh('script/plugin install git://github.com/thoughtbot/shoulda.git')
      end
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/shoulda_generator")
        sh('script/plugin install git://github.com/technicalpickles/shoulda_generator.git') 
      end
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/factory_girl")
        sh('script/plugin install git://github.com/thoughtbot/factory_girl.git') 
      end
    end
    
    desc "Install RESTful Authentication"
    task :restful_auth do
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/restful-authentication")
        sh('git clone git://github.com/technoweenie/restful-authentication.git vendor/plugins/restful-authentication')
      end
    end
    
    desc "Install jRails"
    task :jrails do
      unless File.exist?(File.dirname(__FILE__) + "/../../vendor/plugins/jrails")
        sh('script/plugin install git://github.com/aaronchi/jrails.git')
      end
    end
    
    desc "Run all plugin tasks"
    task :all do
      tasks = tasks_in_namespace("setup:plugins")    
      tasks.each do |task|
        Rake::Task["#{task}"].invoke
      end
    end
  end
end

private
# Borrowed this lovely method from: http://www.betweentherails.com/rake/
  def tasks_in_namespace(ns)
    #grab all tasks in the supplied namespace
    tasks = Rake.application.tasks.select { |t| t.name =~ /^#{ns}:/ }

    #make sure we don't include the :all task
    tasks.reject! { |t| t.name =~ /:all/ }
  end
