# frozen_string_literal: true

# Models/Manager
class Manager < ApplicationRecord
  include Authentifiable

  belongs_to :company

  validates :cpf, presence: true, uniqueness: true
  validate :cpf_format

  def permissions
    { create_journey: true, my_journeys: true, journey_candidatures: true, accept_candidature: true, doctor_profile: true }
  end

  def can?(permission)
    permissions[permission]
  end

  private

  def cpf_format
    errors.add(:cpf, 'Wrong Format') unless
      cpf.match(/\A\d{3}\.\d{3}\.\d{3}\-\d{2}\z/)
  end
end
