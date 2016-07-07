require_relative 'format_plugins/resume_maker'

class ResumeMakerInterface
  def initialize
    @resume_makers = [ResumeMaker]
    @user_data = {}
    @chosen_resume_maker = @resume_makers[0]

    load_format_plugins
  end

  def start
    while true
      choice = display_menu

      case Integer(choice)
      when 1 then get_data
      when 2 then choose_format
      when 3 then save_file
      when 4 then return
      else puts "\nInvalid option"
      end

    end
  end

  def display_menu
    system 'clear'
    puts "\nChoose an option"
    print "
        1. Enter data
        2. Choose format
        3. Export
        4. Quit

        Currently chosen format : #{@chosen_resume_maker.output_format}

        Your option : "
    gets
  end

  def get_data
    system 'clear'

    print ' Name : '
    @user_data['name'] = gets

    print ' Age : '
    @user_data['age'] = Integer(gets)

    print ' Place : '
    @user_data['place'] = gets
  end

  def choose_format
    system 'clear'
    @resume_makers.each_with_index do |resume_maker, index|
      puts "\n\t#{index + 1}. #{resume_maker.output_format}"
    end
    print "\n\n\tYour choice : "
    choice = Integer(gets)

    @chosen_resume_maker = @resume_makers[choice - 1]
  end

  def save_file
    system 'clear'
    print 'file name : '
    file_name = gets.chomp

    @chosen_resume_maker.export(@user_data, file_name)
  end

  def load_format_plugins
    existing_classes = ObjectSpace.each_object(Class).to_a
    files_in_plugins_folder = `ls format_plugins`.scan(/^.*\.rb$/)
    files_in_plugins_folder.each do |file_name|
      require_relative "format_plugins/#{file_name}"
    end

    new_classes = ObjectSpace.each_object(Class).to_a - existing_classes
    new_classes.each do |loaded_class|
      @resume_makers << loaded_class if loaded_class < ResumeMaker
    end
  end
end
