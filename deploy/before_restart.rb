if node[:opsworks][:instance][:layers].first == "rails-app"
  if ::File.directory?("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d")
    ::File.open("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d/local-cross-origin", "w") do |f|
      f.write("<FilesMatch \".(eot|ttf|otf|woff|woff2)\">\n")
      f.write("Header set Access-Control-Allow-Origin \"*\"\n")
      f.write("</FilesMatch>\n")
    end
  end
end
