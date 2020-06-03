@students = [] #an empty array available to all methods

def input_students
  puts "Please enter the names and cohorts of the students,".center(75)
  puts "To finish, hit return at 'Name:'".center(75)
  # get the first name
  puts "Name:"
  name = gets.chomp

  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp
    # if the user types nothing for cohort, default to Nov
      if cohort == ""
        cohort = "november"
      end
    # only commit the information to the array if user is happy

    puts "Check your answer, type yes if correct, type no to redo".center(75)
    puts "name = #{name}, cohort = #{cohort}".center(75)

    check = gets.chop
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
    name = gets.chomp
  end
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

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # will cause program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end
# print how many students we have overall
def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student".center(75)
  else
    puts "Overall, we have #{@students.count} great students".center(75)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 bc there'll be more later
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu