module Spree
  Address.class_eval do

    def state_validate
      # Skip state validation without country (also required)
      # or when disabled by preference
      return if country.blank? || !Spree::Config[:address_requires_state] || country.id != 214

      # ensure associated state belongs to country
      if state.present?
        if state.country == country
          self.state_name = nil #not required as we have a valid state and country combo
        else
          if state_name.present?
            self.state = nil
          else
            errors.add(:state, :invalid)
          end
        end
      end

      # ensure state_name belongs to country without states, or that it matches a predefined state name/abbr
      if state_name.present?
        if country.states.present?
          states = country.states.find_all_by_name_or_abbr(state_name)

          if states.size == 1
            self.state = states.first
            self.state_name = nil
          else
            errors.add(:state, :invalid)
          end
        end
      end

      # ensure at least one state field is populated
      errors.add :state, :blank if state.blank? && state_name.blank?
    end

  end
end
