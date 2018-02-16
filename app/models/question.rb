class Question < ApplicationRecord
 validates :title,        presence: false
 validates :level,        presence: false
 validates :available_at, presence: false
 validates :biz_id,       presence: false
 validates :description,  presence: false
 validates :tests,        presence: false
 validates :initial ,     presence: false
end
