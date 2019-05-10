module ActionController
  class Parameters
    def valid?(validator)
      dup_params = deep_dup
      @result = validator.call(dup_params.permit!.to_hash)
      @result.errors.empty?
    end

    def errors(full: false)
      @result&.messages(full: full) || {}
    end

    def result
      @result&.to_hash || {}
    end
  end
end
