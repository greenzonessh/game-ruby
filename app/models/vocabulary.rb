class Vocabulary < ApplicationRecord
  validates :word, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ , message: " => You don't give space"}
end
