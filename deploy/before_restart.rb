require 'yaml'

if node[:opsworks][:instance][:layers].first == "rails-app"
  # NOTE: allow origin * for fonts when we deploy through Apache
  if ::File.directory?("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d")
    ::File.open("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d/local-cross-origin", "w") do |f|
      f.write("<FilesMatch \".(eot|ttf|otf|woff|woff2)\">\n")
      f.write("Header set Access-Control-Allow-Origin \"*\"\n")
      f.write("</FilesMatch>\n")
    end
  end

  # NOTE: create aws ses yml
  ::File.open("#{release_path}/config/aws_ses.yml", "w") do |f|
    f.write({
      node[:deploy][:mspan_rails][:rails_env] => {
        "access_key_id"     => node[:deploy][:mspan_rails][:aws_ses][:access_key_id],
        "secret_access_key" => node[:deploy][:mspan_rails][:aws_ses][:secret_access_key]
      }
    }.to_yaml)
  end
end
