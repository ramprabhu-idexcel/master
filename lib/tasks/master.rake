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

  desc "Increase login attempt count"
  task login_attempt: :environment do
    puts "------------ Start -----------"
    50.times do
      User.all.each do |user|
        user.sign_in_count = user.sign_in_count + 1
        user.save(validate: false)
      end
    end
    puts "---------- End ---------------"
  end
end
