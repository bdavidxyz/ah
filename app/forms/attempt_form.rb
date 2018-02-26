class AttemptForm < ActiveType::Object

  attribute :biz_id, :string
  attribute :honeypot, :string
  attribute :initial_functionf, :string
  attribute :functionf, :string
  attribute :nb_of_lint_warning, :integer
  attribute :nb_of_lint_error, :integer
  attribute :nb_of_green_test, :integer, default: 0
  attribute :nb_of_red_test, :integer, default: 0
  attribute :nb_of_second_spent, :integer

  validate :cannot_have_filled_honeypot
  validate :cannot_spend_less_than_5_seconds
  validate :cannot_have_unchanged_functionf

  def cannot_have_filled_honeypot
    if honeypot.present?
      errors.add(:cannot_have_filled_honeypot, 'Erreur inconnue')
    end 
  end

  def cannot_have_unchanged_functionf
    if stripped(initial_functionf) == stripped(functionf) 
      errors.add(:cannot_have_unchanged_functionf, 'Erreur : vous devez essayer de remplir la fonction f')
    end 
  end

  def cannot_spend_less_than_5_seconds
    if nb_of_second_spent <= 5
      errors.add(:cannot_spend_less_than_5_seconds, 'Vous devez chercher un peu avant de valider le test')
    end 
  end

private
  def stripped(str)
    str.gsub("\\n", "").gsub("\n", "").gsub("\r", "").gsub("\\r", "")
  end


end
