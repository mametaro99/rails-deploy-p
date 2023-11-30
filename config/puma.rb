# Pumaの設定ファイル
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV'] || "production" }
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!
plugin :tmp_restart
# ここでapp_rootを直接指定します
app_root = "/home/webapp/rails-deploy-p"

# bind行を更新して、新しいapp_rootを使用します
bind "unix:#{app_root}/tmp/sockets/puma.sock"