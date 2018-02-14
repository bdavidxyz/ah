class Attempt < ApplicationRecord
  validates :biz_id,             presence: true, uniqueness: true
  validates :functionf,          presence: true, allow_blank: false
  validates :nb_of_second_spent, presence: true
  validates :nb_of_lint_warning, presence: true
  validates :nb_of_green_test,   presence: true
  validates :nb_of_red_test,     presence: true
  validates :is_done,            presence: false
end
