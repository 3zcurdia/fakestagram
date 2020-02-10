# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= users(:one)
  end

  def test_valid
    assert user.valid?
  end

  def test_invalid_nil_name
    user.name = nil
    refute user.valid?
  end

  def test_id_as_uuid
    assert user.id =~ /[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}/
  end
end
