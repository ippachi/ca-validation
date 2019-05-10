require 'test_helper'

class ActionController::Parameters::Test < ActiveSupport::TestCase
  class PersonValidator
    include Ca::Validation

    validate do
      required(:person).schema do
        required(:name).filled(:int?)
        required(:age)
        required(:role)
        required(:email)
      end
    end
  end

  class OtherValidator
    include Ca::Validation

    validate do
      required(:person).schema do
        required(:name)
        required(:age)
        required(:role)
        required(:email)
      end
    end
  end

  test "it valid? returns false" do
    params = ActionController::Parameters.new({
      person: {
        name: "Francesco",
        age:  22,
        role: "admin"
      }
    })

    assert_equal params.valid?(PersonValidator), false
    assert_not_equal params.errors, {}
    assert_not_equal params.full_messages, {}
  end

  test "it valid? returns true" do
    params = ActionController::Parameters.new({
      person: {
        name: "Francesco",
        age:  22,
        role: "admin"
      }
    })

    assert_equal params.valid?(OtherValidator), true
    assert_equal params.errors, {}
    assert_equal params.full_messages, {}
  end
end
