@students = [] #an empty array available to all methods

def input_students
  puts "Please enter the names and cohorts of the students".center(75)
  puts "To finish, hit return at 'Name:'".center(75)
  # get the first name
  puts "Name:"
  name = STDIN.gets.chomp

  while !name.empty? do
    puts "Cohort:"
    cohort = STDIN.gets.chomp!
    # if the user types nothing for cohort, default to Nov
    if cohort == ""
      cohort = "november"
    end
    # only commit the information to the array if user is happy

    puts "Check your answer, type yes if correct, type no to redo".center(75)
    puts "name = #{name}, cohort = #{cohort}".center(75)

    check = STDIN.gets.chop
    if check == "yes"
      @students << {name: name, cohort: cohort.to_sym}
      # confirm how many students are in the array now

      if @students.length == 1
        puts "Now we have 1 student".center(75)
      else
        puts "Now we have #{@students.count} students".center(75)
      end
    end
    # get more students
    puts "Name:"
    name = STDIN.gets.chomp
  end
end

def collect_more_info # to ask for the students cohort, hobby, height and hometown
  
# can't get the default to work outside of the input_student method
# wIP to be completed later
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end

def print_students_list
    @students.each do |student|
      puts "#{student[:name]} : #{student[:cohort]} cohort".center(75)
    end
end

def print_footer # print how many students we have overall
  if @students.count == 1
    puts "Overall, we have 1 great student".center(75)
  else
    puts "Overall, we have #{@students.count} great students".center(75)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def show_student_stories

end

def save_students
  file = File.open("students.csv", "w") #open the file for writing
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") 
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry #{filename} does not exist"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the student list from students.csv"
  puts "5. Show the story of each student"
  puts "9. Exit" # 9 bc there'll be more later
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    show_student_stories
  when "9"
    exit # will cause program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

try_load_students
interactive_menu