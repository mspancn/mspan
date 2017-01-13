if node[:opsworks][:instance][:layers].first == "rails-app"

  execute "rake assets:precompile" do
    cwd release_path
    command "bundle exec rake assets:precompile"
    environment "RAILS_ENV" => node[:deploy][:mspan_rails][:rails_env]
  end
end
