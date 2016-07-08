require_relative 'format_plugins/resume_maker_template'
require_relative 'user_data'
require_relative 'plugin_loader'

class ResumeMakerUserInterface
  def initialize
    @resume_makers = []
    @user_data = UserData.new
    @plugin_loader = PluginLoader.new

    load_format_plugins
    @chosen_resume_maker = @resume_makers[0]
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
    record = []
    %w{Name Age Place}.each do |attribute|
      print " #{attribute} : "
      record << gets.chomp
    end
    @user_data.name, @user_data.age, @user_data.place = record
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
    @resume_makers += @plugin_loader.load_plugins
  end
end
