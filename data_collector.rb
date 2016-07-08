require_relative 'user_data'

class DataCollector
  def collect_data(fields)
    system 'clear'
    collected_data = {}
    fields.each do |field|
      print " #{field} : "
      collected_data[field.downcase] = gets.chomp
    end

    UserData.new(collected_data)
  end

  def display_menu(current_choice)
    puts "\nChoose an option"
    print "
        1. Enter data
        2. Choose format
        3. Export
        4. Quit

        Currently chosen format : #{current_choice}

        Your option : "
    gets
  end

  def choose_format(resume_makers)
    system 'clear'
    resume_makers.each_with_index do |resume_maker, index|
      puts "\n\t#{index + 1}. #{resume_maker.output_format}"
    end
    print "\n\n\tYour choice : "
    Integer(gets.chomp) - 1
  end

  def get_save_file_name
    system 'clear'
    print 'file name : '
    file_name = gets.chomp
  end

  def show_message(msg)
    puts msg
  end
end
