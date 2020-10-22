# frozen_string_literal: true

module Resolvers
  # GraphQL/Resolvers/FindJourneysResolver
  class FindJourneysResolver < Resolvers::BaseResolver
    argument :start_date, String, required: false
    argument :end_date, String, required: false
    argument :start_payment_date, String, required: false
    argument :end_payment_date, String, required: false
    argument :wage, Float, required: false
    argument :address, String, required: false
    argument :payment_method, Types::PaymentMethodType, required: false
    argument :provides_ppe, Boolean, required: false
    argument :hire_entity, Types::HireEntityType, required: false
    argument :page, Integer, required: false
    argument :per_page, Integer, required: false

    type Types::FindJourneysType, null: false

    def resolve(
      start_date: nil, end_date: nil, start_payment_date: nil, end_payment_date: nil, wage: nil,
      address: nil, payment_method: nil, provides_ppe: nil, hire_entity: nil, page: 1, per_page: 5
    )
      journeys = apply_scopes(
        start_date, end_date, start_payment_date, end_payment_date,
        wage, address, payment_method, provides_ppe, hire_entity
      )
      pagination = get_pagination(page, journeys.count, per_page)
      journeys = filter_page(journeys, page, per_page)

      { pagination: pagination, journeys: journeys }
    end

    private

    def apply_scopes(
      start_date, end_date, start_payment_date, end_payment_date,
      wage, address, payment_method, provides_ppe, hire_entity
    )
      Journey.with_date_after(start_date)
             .with_date_before(end_date)
             .with_payment_date_after(start_payment_date)
             .with_payment_date_before(end_payment_date)
             .with_wage_bigger_than(wage)
             .with_address(address)
             .with_payment_method(payment_method)
             .that_provides_ppe(provides_ppe)
             .that_hires(hire_entity)
    end

    def number_of_pages(total, per_page)
      total / per_page
    end
  end
end
