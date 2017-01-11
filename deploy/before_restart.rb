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
        # Redirect *.mspan.cn to https://mspan.cn
        f.write("RewriteCond %{HTTP_HOST} ^(.)+\\.mspan\\.cn$\n")
        f.write("RewriteRule ^(.*)$ http://mspan.cn$1 [R,L]\n")

        # Redirect mspan.us to https://mspan.cn/teacherhome
        f.write("RewriteCond %{HTTP_HOST} ^mspan\\.us$\n")
        f.write("RewriteRule ^(.*)$ http://mspan.cn/teacherhome [R,L]\n")

        # Redirect *.elb.amazonaws.com to https://mspan.cn
        f.write("RewriteCond %{HTTP_HOST} ^(.)+\\.elb\\.amazonaws\\.com$\n")
        f.write("RewriteRule ^(.*)$ http://mspan.cn$1 [R,L]\n")
      end
      # Force https
      # f.write("RewriteCond %{HTTP:X-Forwarded-Proto} !https\n")
      # f.write("RewriteRule !/status https://%{SERVER_NAME}%{REQUEST_URI} [R,L]\n")
    end
  end
end
