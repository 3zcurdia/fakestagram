# frozen_string_literal: true

require 'test_helper'

class LikePolicyTest < ActiveSupport::TestCase
  def account
    @account ||= accounts(:one)
  end

  def like
    @like ||= likes(:one)
  end

  def policy
    @policy ||= LikePolicy.new(account, like)
  end

  def test_show
    assert policy.show?
  end

  def test_create
    assert policy.create?
  end

  def test_update
    refute policy.update?
  end

  def test_destroy
    assert policy.destroy?
    policy.stub :owner?, false do
      refute policy.destroy?
    end
  end
end
