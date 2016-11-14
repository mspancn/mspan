rails_env = new_resource.environment["RAILS_ENV"]  
current_release = release_path

if node[:opsworks][:instance][:layers].first == "rails-app"
  execute "rake assets:precompile" do
    cwd current_release
    command "bundle exec rake assets:precompile"
    environment "RAILS_ENV" => rails_env
  end
end
