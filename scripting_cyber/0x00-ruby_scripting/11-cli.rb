#!/usr/bin/env ruby

require 'optparse'

TASKS_FILE = 'tasks.txt'

# Charger les tâches
def load_tasks
  return [] unless File.exist?(TASKS_FILE)

  File.readlines(TASKS_FILE).map(&:chomp)
end

# Sauvegarder les tâches
def save_tasks(tasks)
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
end

options = {}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on('-a', '--add TASK', 'Add a new task') do |task|
    options[:add] = task
  end

  opts.on('-l', '--list', 'List all tasks') do
    options[:list] = true
  end

  opts.on('-r', '--remove INDEX', 'Remove a task by index') do |index|
    options[:remove] = index.to_i
  end

  opts.on('-h', '--help', 'Show help') do
    puts opts
    exit
  end
end

parser.parse!

tasks = load_tasks

if options[:add]
  tasks << options[:add]
  save_tasks(tasks)
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  tasks.each_with_index do |task, index|
    puts "#{index + 1}. #{task}"
  end

elsif options[:remove]
  index = options[:remove] - 1

  if index >= 0 && index < tasks.length
    removed = tasks.delete_at(index)
    save_tasks(tasks)
    puts "Task '#{removed}' removed."
  else
    puts "Invalid index."
  end

else
  puts parser
end
