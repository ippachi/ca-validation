module ActionController
  class Parameters
    def valid?(validator)
      @result = validator.call(parameters)
      @result.errors.empty?
    end

    def errors
      @result.errors
    end

    def full_messages
      @result.messages(full: true)
    end
  end
end
