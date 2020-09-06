require "pry"
class Task
  attr_accessor :id, :name, :the_details
  @@count = 0
  
  def initialize(params)
    @id = @@count += 1
    @name = params[:name]
    @the_details = params[:the_details]
  end

end

class To_do

  def initialize
    @tasks = []
  end
  
  def add(task)
    @tasks << task
    puts "タスクID:#{task.id}を追加しました。"
  end
  
  def index
    puts "***********"
    puts "<タスク一覧>"
    @tasks.each do |task|
      puts "ID: #{task.id} タスク名: #{task.name} 詳細: #{task.the_details}"
    end
    puts "***********"
  end
  
  def delete(id:)
    if task = @tasks.find{|task| task.id == id}
      @tasks.delete(task)
      puts "--------------------------"
      puts "タスクNo.#{id}を削除しました。"
      puts "--------------------------"
    else
      puts "--------------------------"
      puts "タスクNo.#{id}はありません。"
      puts "--------------------------"
    end
  end

end

task1 = Task.new(name: "起きる", the_details: "7時30分")
task2 = Task.new(name: "朝ごはんを食べる", the_details: "8時")
task3 = Task.new(name: "身支度をする", the_details: "９時")
task4 = Task.new(name: "出勤する", the_details: "9時30分")
task5 = Task.new(name: "会社に到着", the_details: "10時")
to_do = To_do.new
to_do.add(task1)
to_do.add(task2)
to_do.add(task3)
to_do.add(task4)
to_do.add(task5)
to_do.index
to_do.delete(id: 1)
to_do.delete(id: 7)
to_do.index