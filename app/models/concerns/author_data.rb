# frozen_string_literal: true

module AuthorData
  def author_id
    account.id
  end

  def author_name
    account.name
  end
end
