require "administrate/base_dashboard"

class AttemptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    biz_id: Field::String,
    functionf: Field::Text,
    nb_of_second_spent: Field::Number,
    nb_of_lint_warning: Field::Number,
    nb_of_lint_error: Field::Number,
    nb_of_green_test: Field::Number,
    nb_of_red_test: Field::Number,
    status: Field::String,
    score: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    question: Field::BelongsTo,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :created_at,
    :score,
    :question,
    :nb_of_second_spent,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :biz_id,
    :functionf,
    :nb_of_second_spent,
    :nb_of_lint_warning,
    :nb_of_lint_error,
    :nb_of_green_test,
    :nb_of_red_test,
    :score,
    :status,
    :created_at,
    :updated_at,
    :question,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :biz_id,
    :functionf,
    :nb_of_second_spent,
    :nb_of_lint_warning,
    :nb_of_lint_error,
    :nb_of_green_test,
    :nb_of_red_test,
    :score,
    :status,
    :question,
  ].freeze

  # Overwrite this method to customize how attempts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(attempt)
  #   "Attempt ##{attempt.id}"
  # end
end
