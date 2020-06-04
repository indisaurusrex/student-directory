@students = [] #an empty array available to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 bc there'll be more later
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You chose to input students, here you go ..."
    input_students
  when "2"
    puts "You chose to show the students we have..."
    show_students
  when "3"
    puts "You chose save, where to though?"
    save_students
  when "4"
    puts "You've chosen load, we're on it..."
    load_students(file_choice)
  when "9"
    puts "See you later!"
    exit # will cause program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  print_intro
  while true do
    name, cohort = STDIN.gets.chomp.split(",")
    break if name == "quit"
    add_students_to_array(name, cohort)
    print_student_count
  end
end

def print_intro
  puts "Please enter the name and cohort separated by a comma"
  puts "To finish, type quit and hit return"
end

def show_students
  print_header
  print_students_list
  print_student_count
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def file_choice
  puts "which existing file do you want to use?"
    filename = gets.chomp
    if !File.exists?(filename)
      puts "sorry that file doesn't exist, please create it first"
      interactive_menu
    end
end

def save_students
  file_choice
  file = File.open(filename="students.csv", "w")
  @students.each do |student|
    file.puts "#{student[:name]},#{student[:cohort]}"
  end
  file.close
end

def load_students(filename="students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students_to_array(name, cohort)
  end
  file.close
  print_student_count
end

def try_load_students(filename="students.csv")
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

def add_students_to_array(name, cohort)
  @students << {name: name, cohort: cohort.strip.to_sym}
end

def print_student_count
  puts "Now we have #{@students.count} great students"
end


try_load_students
interactive_menu
