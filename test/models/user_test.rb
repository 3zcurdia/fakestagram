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
    user.username = nil
    refute user.valid?
  end

  def test_valid_password
    assert user.authenticate('secret123')
  end

  def test_invalid_password
    refute user.authenticate('i.am.batman')
  end
end
