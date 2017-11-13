env :GEM_PATH, ENV['GEM_PATH']
# env :PATH, ENV['PATH']
every 1.minute do
  runner "Comment.add_comment", :output => "#{path}/log/cron.log"
end
