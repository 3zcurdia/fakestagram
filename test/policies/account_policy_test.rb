# frozen_string_literal: true

require 'test_helper'

class AccountPolicyTest < ActiveSupport::TestCase
  def account
    @account ||= accounts(:one)
  end

  def policy
    @policy ||= AccountPolicy.new(account, account)
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
    refute policy.destroy?
  end
end
