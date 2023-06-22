module Sanitize
    def self.sanitize_input(value)
        value_sanitize = /[A-Za-z0-9]/.match(value)
        value_sanitize
    end
end