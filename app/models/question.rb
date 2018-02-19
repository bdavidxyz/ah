class Question < ApplicationRecord 
  
  validates :title,        presence: false
  validates :level,        presence: false
  validates :available_at, presence: false
  validates :biz_id,       presence: false
  validates :description,  presence: false
  validates :tests,        presence: false
  validates :initial ,     presence: false

  scope :easy, -> { where(level: 'easy') }
  scope :hard, -> { where(level: 'hard') }
  scope :most_recent, -> { order(available_at: :desc).limit(1) }
end
