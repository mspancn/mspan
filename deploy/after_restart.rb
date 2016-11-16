if node[:opsworks][:instance][:layers].first == "rails-app"

  if ::File.exists?("/srv/www/mspan_rails/shared/pids/delayed_job.pid")
    execute "monit restart delayed_job" do
      command "monit restart delayed_job"
    end
  end
end
