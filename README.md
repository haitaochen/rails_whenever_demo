#### Rails 利用whenever 配合Linux下的cron 实现周期性任务

##### 安装

> ```Gemfile
> gem 'whenever', :require => false
> ```

##### 准备

> ```powershell
> $ cd /apps/my-great-project
> $ wheneverize .
> ```

执行后生成：

> config/schedule.rb

##### 更新cron(很关键，当初我就忘了)

```powershell
$ whenever --update-crontab
```

##### 执行

```powershell
$ whenever
```

cron用法：

* 如上的更新
* 查看cron 的任务列表

> crontab -l

* 终止任务

> crontab -e



##### 举例

1：schedule.rb:

```ruby
every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  command "rm '/Users/cht/Desktop/cron/tmp/relation.png'"
end
#举例1：每间隔一秒删除tmp文件夹下的图片文件
```

2: schedule.rb:(执行模型操作，对数据库做周期性操作)

```ruby
every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  runner "Post.shanchu", :environment => :development
  #指定开发环境
end
#举例2：没间隔一分钟删除Post表的第一条数据
```

post.rb:

```ruby
class Post < ActiveRecord::Base
	def self.shanchu
		id = Post.first.id
		Post.delete(id)
	end
end
```



上述操作可以用以下命令直接在命令行里测试：

>  bundle exec bin/rails runner -e development "Post.shanchu"

nice



等一分钟，或许下一分钟