# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def account
    @account ||= accounts(:one)
  end

  def test_valid
    assert account.valid?
  end

  def test_invalid_nil_name
    account.name = nil
    refute account.valid?
  end

  def test_id_as_uuid
    assert /[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}/ =~ account.id
  end
end
