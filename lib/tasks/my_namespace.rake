namespace :my_namespace do
  desc "TODO"
  task update_user: :environment do
    # admin permissions to all users
    puts "==============> Start <=============="
    User.update_all(is_admin: true)
    puts "==============> End <================"
  end

end
