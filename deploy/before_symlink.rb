require 'yaml'

if node[:opsworks][:instance][:layers].first == "rails-app"

  # NOTE: create aws ses yml
  ::File.open("#{release_path}/config/aws_ses.yml", "w") do |f|
    f.write({
      node[:deploy][:mspan_rails][:rails_env] => {
        "access_key_id"     => node[:deploy][:mspan_rails][:aws_ses][:access_key_id],
        "secret_access_key" => node[:deploy][:mspan_rails][:aws_ses][:secret_access_key]
      }
    }.to_yaml)
  end

  # NOTE: create aws s3 yml
  ::File.open("#{release_path}/config/aws_s3.yml", "w") do |f|
    f.write({
      node[:deploy][:mspan_rails][:rails_env] => {
        "access_key_id"     => node[:deploy][:mspan_rails][:aws_s3][:access_key_id],
        "secret_access_key" => node[:deploy][:mspan_rails][:aws_s3][:secret_access_key]
      }
    }.to_yaml)
  end

  execute "rake assets:precompile" do
    cwd release_path
    command "bundle exec rake assets:precompile"
    environment "RAILS_ENV" => node[:deploy][:mspan_rails][:rails_env]
  end
end
