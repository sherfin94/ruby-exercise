class ResumeMakerTemplate
  @output_format = 'Format Name'
  @file_extension = 'Format Extension'

  class << self
    attr_reader :output_format, :file_extension
  end
end
