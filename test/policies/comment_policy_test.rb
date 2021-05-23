# frozen_string_literal: true

require 'test_helper'

class CommentPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= users(:one)
  end

  def comment
    @comment ||= comments(:one)
  end

  def policy
    @policy ||= PostPolicy.new(user, comment)
  end

  def test_show
    assert policy.show?
  end

  def test_create
    assert policy.create?
  end

  def test_update
    assert policy.update?
    policy.stub :owner?, false do
      assert_not policy.update?
    end
  end

  def test_destroy
    assert policy.destroy?
    policy.stub :owner?, false do
      assert_not policy.destroy?
    end
  end
end
