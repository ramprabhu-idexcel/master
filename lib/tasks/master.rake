require 'json'
namespace :master do
  desc "TODO"
  task update_user: :environment do
    # admin permissions to all users
    puts "==============> Start <=============="
    User.update_all(is_admin: true)
    puts "==============> End <================"
  end

  desc "Update existing quiz"
  task update_quiz: :environment do
    puts "************ Start *********************"
    Quiz.destroy_all
    ["computer",'gk'].each do |quiz|
      file = File.read("app/assets/json/#{quiz}.json")
      data_hash = JSON.parse(file)
      quiz.camelize.constantize.create!(data_hash)
    end
    puts "************ End ***********************"
  end
end
