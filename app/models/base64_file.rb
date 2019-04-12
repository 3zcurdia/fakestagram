# frozen_string_literal: true

class Base64File
  def initialize(base64_data)
    @base64_data = base64_data
    return unless block_given?

    decode!
    yield(self)
  end

  def decode!
    raise 'Invalid data format' unless valid?

    @headers, data = base64_data.split(',')
    @decoded_data  = Base64.decode64(data)
  end

  def filename
    @filename ||= SecureRandom.uuid
  end

  def content_type
    @content_type ||= get_content_type(headers)
  end

  def io
    @io ||= StringIO.new(decoded_data)
  end

  def valid?
    base64_data&.is_a?(String) && base64_data.strip.start_with?('data')
  end

  private

  attr_reader :base64_data, :headers, :decoded_data

  def get_content_type(headers)
    headers =~ /^data:(.*?)$/
    Regexp.last_match(1).split(';base64').first
  end
end
