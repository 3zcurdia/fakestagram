# frozen_string_literal: true

class Base64File < StringIO
  def initialize(encoded_file)
    @encoded_file = encoded_file
    raise ArgumentError unless valid?

    @headers, encoded_bytes = encoded_file.split(',')
    raise ArgumentError if encoded_bytes.eql?('(null)')

    @bytes = Base64.decode64(encoded_bytes)

    super(@bytes)
  end

  def original_filename
    @original_filename ||= File.basename("#{SecureRandom.uuid}.#{file_extension}")
  end

  def content_type
    @content_type ||= fetch_content_type
  end

  def file_extension
    @file_extension ||= fetch_file_extension
  end

  def valid?
    encoded_file.is_a?(String) && encoded_file.strip.start_with?('data')
  end

  private

  attr_reader :encoded_file, :headers, :bytes

  # Determine content type from input, with provided type as fallback
  def fetch_content_type
    detected_type = MimeMagic.by_magic(bytes)
    detected_type&.type || headers.split(';base64').first
  end

  # Determine content type from input, with provided type as fallback
  def fetch_file_extension
    mime_type = MIME::Types[content_type].last
    raise "Unknown MIME type: #{content_type}" unless mime_type

    mime_type.preferred_extension
  end
end
