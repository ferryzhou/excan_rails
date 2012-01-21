desc "This task is called by the Heroku scheduler add-on"
task :extract_posts => :environment do
    puts "Extracting posts ..."
    PostsController.new.extract
    puts "done."
end