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

  # NOTE: create aws s3 yml
  ::File.open("#{release_path}/config/secrets.yml", "w") do |f|
    f.write({
      node[:deploy][:mspan_rails][:rails_env] => {
        "secret_key_base" => node[:deploy][:mspan_rails][:secret_key_base]
      }
    }.to_yaml)
  end

  # NOTE: create aws s3 yml
  ::File.open("#{release_path}/config/rollbar.yml", "w") do |f|
    f.write({
      node[:deploy][:mspan_rails][:rails_env] => {
        "rollbar_access_token" => node[:deploy][:mspan_rails][:rollbar_access_token]
      }
    }.to_yaml)
  end
end
