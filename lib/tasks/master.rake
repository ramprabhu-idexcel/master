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

  desc "Update computer quiz"
  task computer_quiz: :environment do
    puts "******** start *******"
    computer = Computer.new(question: "CSS Stands for", answer: "Cascading Style Sheets")
    computer.options << "{Computer Styled Sections}"
    computer.options << "{Cascading Style Sheets}"
    computer.options << "{Crazy Solid Shapes}"
    computer.options << "{None of the above}"
    computer.save!
    puts "<====== computer object ====>"
    puts computer.inspect
    puts "******** end *******"
  end
end
