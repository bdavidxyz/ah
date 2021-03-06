class Attempt < ApplicationRecord
  validates :biz_id,             presence: true, uniqueness: true
  validates :functionf,          presence: false
  validates :nb_of_second_spent, presence: false  
  validates :nb_of_lint_warning, presence: false
  validates :nb_of_lint_error,   presence: false
  validates :nb_of_green_test,   presence: false
  validates :nb_of_red_test,     presence: false
  validates :status,             presence: false

  belongs_to :question, optional: false

end
