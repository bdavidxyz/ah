require "administrate/base_dashboard"

class QuestionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    biz_id: Field::String,
    level: Field::String,
    available_at: Field::DateTime,
    description: Field::Ckeditor,
    tests: Field::Text,
    initial: Field::Text,
    point_max: Field::Number,
    point_loss: Field::Number,
    point_plateau: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :biz_id,
    :point_max,
    :available_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :biz_id,
    :level,
    :available_at,
    :description,
    :tests,
    :point_max,
    :point_loss,
    :point_plateau,
    :initial,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :biz_id,
    :level,
    :available_at,
    :description,
    :tests,
    :point_max,
    :point_loss,
    :point_plateau,
    :initial,
  ].freeze

  # Overwrite this method to customize how questions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(question)
  #   "Question ##{question.id}"
  # end
end
