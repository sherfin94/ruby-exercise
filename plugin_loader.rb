class PluginLoader
  def load_classes_from_folder(folder_name)
    files_in_folder = Dir.entries(folder_name).select do |entry|
      entry =~ /.*\.rb/
    end
    files_in_folder.each do |file_name|
      require_relative "#{folder_name}/#{file_name}"
    end
  end

  def load_plugins
    existing_classes = ObjectSpace.each_object(Class).to_a
    load_classes_from_folder('format_plugins')
    new_classes = ObjectSpace.each_object(Class).to_a - existing_classes

    resume_makers = []
    new_classes.each do |loaded_class|
      resume_makers << loaded_class if validate_plugin(loaded_class)
    end
    resume_makers
  end

  def validate_plugin(aClass)
    aClass < ResumeMakerTemplate && aClass.respond_to?(:export)
  end
end
