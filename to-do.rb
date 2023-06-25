require_relative 'app/app.rb'

puts "1- Create Task\n2- Read Task\n3- Update Task\n4- Delete Task\n5- Close"
tasks = Tasks.new

loop do
    choice_user = gets.chomp.to_i
    puts "-"*20

    case choice_user
    when 1
        puts "\nTitle:\t"
        title_task = gets.chomp.to_s
        puts "\nComment:\t"
        comment_task = gets.chomp.to_s
        puts "-"*20

        tasks.create_task(title_task, comment_task)
    when 2
        list_task = tasks.read_task

        list_task.each do |dates|
            puts "_"*40
            puts "Id: #{dates[0]}"
            puts "Title: #{dates[1]}"
            puts "Comment: #{dates[2]}"
            puts "_"*40
            puts "\n"
        end
    when 3
        puts "\nTitle Update:\t"
        title_task_update = gets.chomp.to_s
        puts "\nComment Update:\t"
        comment_task_update = gets.chomp.to_s
        puts "\nId Task:\t"
        id_task_update = gets.chomp.to_s
        puts "-"*20

        tasks.update_task(title_task_update, comment_task_update, id_task_update)
    when 4
        puts "\nId Task:\t"
        id_task_delete = gets.chomp.to_s
        puts "-"*20

        tasks.delete_task(id_task_delete)
    when 5
        break
    else
        puts "Underfined Functions irmao pohaaa"
    end
end