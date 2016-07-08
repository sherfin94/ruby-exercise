require_relative 'resume_maker_template'
require 'Prawn'

class PDFResumeMaker < ResumeMakerTemplate
  @output_format = 'PDF'
  @file_extension = 'pdf'

  class << self
    attr_reader :output_format, :file_extension
  end

  def self.export(user_details, file_name)
    user_details_as_hash = user_details.to_hash
    pdf = Prawn::Document.new

    user_details_as_hash.each do |_key, value|
      pdf.text value, font_size: 72, justification: :center
    end

    pdf.render_file "#{file_name}.#{@file_extension}"
  end
end
