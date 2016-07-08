require_relative 'format_plugins/resume_maker_template'
require_relative 'user_data'
require_relative 'plugin_loader'
require_relative 'data_collector'

class ResumeMakerUserInterface
  def initialize
    @resume_makers = []
    @plugin_loader = PluginLoader.new
    @data_collector = DataCollector.new

    load_format_plugins
    @chosen_resume_maker = @resume_makers[0]
  end

  def start
    while true
      choice = @data_collector.display_menu(@chosen_resume_maker.output_format)

      case Integer(choice)
      when 1 then get_data
      when 2 then choose_format
      when 3 then save_file
      when 4 then return
      else @data_collector.show_message("Invalid Option")
      end
    end
  end

  def get_data
    @user_data = @data_collector.collect_data(%w(Name Age Place))
  end

  def choose_format
    choice = @data_collector.choose_format(@resume_makers)

    @chosen_resume_maker = @resume_makers[choice]
  end

  def save_file
    file_name = @data_collector.get_save_file_name

    @chosen_resume_maker.export(@user_data, file_name)
  end

  def load_format_plugins
    @resume_makers += @plugin_loader.load_plugins
  end
end
