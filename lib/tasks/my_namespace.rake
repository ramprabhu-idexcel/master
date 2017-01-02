namespace :my_namespace do
  desc "TODO"
  task update_user: :environment do
    # admin permissions to all users
    User.update_all(is_admin: true)
  end

end
