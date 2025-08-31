class Article < ApplicationRecord
  scope :search_by_title, ->(query) {
    if query && query.strip != ""
      where('title LIKE ?', "%#{query}%")
    end
  }
end
