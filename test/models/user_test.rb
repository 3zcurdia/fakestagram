# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  public_key      :string
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
    assert_not user.valid?
  end

  def test_valid_password
    assert user.authenticate('secret123')
  end

  def test_invalid_password
    assert_not user.authenticate('i.am.batman')
  end
end
