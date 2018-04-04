set :application, "minibank"
set :repository,  "git://github.com/macuk/minibank-app.git"
set :scm, :git
set :use_sudo, false
set :user, 'mb'
set :deploy_to, "/home/#{user}/#{application}"

role :web, "d3"
role :app, "d3"
role :db,  "d3", :primary => true

namespace :deploy do
  namespace :app do
    task :copy_config do
      run "cp #{shared_path}/config/* #{current_release}/config/"
    end
  end

  task :start do
    run "cd #{current_path} && ./bin/app start"
  end

  task :stop do
    run "cd #{current_path} && ./bin/app stop"
  end

  task :resetart do
    run "cd #{current_path} && ./bin/app restart"
  end
end

after "deploy:finalize_update", "deploy:app:copy_config"
