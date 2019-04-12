# frozen_string_literal: true

require 'test_helper'

class PostPolicyTest < ActiveSupport::TestCase
  def account
    @account ||= accounts(:one)
  end

  def post
    @post ||= posts(:one)
  end

  def policy
    @policy ||= PostPolicy.new(account, post)
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
      refute policy.update?
    end
  end

  def test_destroy
    assert policy.destroy?
    policy.stub :owner?, false do
      refute policy.destroy?
    end
  end
end
