every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  command "rm '/Users/cht/Desktop/cron/tmp/relation.png'"
  runner "Post.shanchu", :environment => :development
end