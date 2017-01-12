if node[:opsworks][:instance][:layers].first == "rails-app"
  # NOTE: allow origin * for fonts when we deploy through Apache
  if ::File.directory?("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d")
    ::File.open("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d/local-cross-origin", "w") do |f|
      f.write("<FilesMatch \".(eot|ttf|otf|woff|woff2)\">\n")
      f.write("Header set Access-Control-Allow-Origin \"*\"\n")
      f.write("</FilesMatch>\n")
    end

    ::File.open("#{node[:apache][:dir]}/sites-available/mspan_rails.conf.d/rewrite", "w") do |f|
      if node[:deploy][:mspan_rails][:rails_env] == "ppe"
        # Redirect mspan.cn to http://www.mspan.cn
        f.write("RewriteCond %{HTTP_HOST} ^mspan\\.cn$\n")
        f.write("RewriteRule ^(.*)$ http://www.mspan.cn$1 [R=301,L]\n")

        # Redirect mspan.us to http://www.mspan.cn/teacherhome
        f.write("RewriteCond %{HTTP_HOST} ^mspan\\.us$\n")
        f.write("RewriteRule ^(.*)$ http://www.mspan.cn/teacherhome [R,L]\n")

        # Redirect *.mspan.us to http://www.mspan.cn/teacherhome
        f.write("RewriteCond %{HTTP_HOST} ^www\\.mspan\\.us$\n")
        f.write("RewriteRule ^(.*)$ http://www.mspan.cn/teacherhome [R,L]\n")
      end
    end
  end
end
