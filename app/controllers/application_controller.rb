# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::Helpers
  include Pundit
  helper ImageHelper
end
