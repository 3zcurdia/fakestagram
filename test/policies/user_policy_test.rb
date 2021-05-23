# frozen_string_literal: true

require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= users(:one)
  end

  def policy
    @policy ||= UserPolicy.new(user, user)
  end

  def test_show
    assert policy.show?
  end

  def test_create
    assert policy.create?
  end

  def test_update
    assert policy.update?
  end

  def test_destroy
    assert_not policy.destroy?
  end
end
