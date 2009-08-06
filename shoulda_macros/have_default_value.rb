module HaveDefaultValue
  def should_have_default_value(field, value = nil)
    klass_name = self.name.gsub(/Test$/, '').constantize
 
    context "#{klass_name}" do
      should "have a default value of '#{value}' for '#{field}'" do
          klass = subject
          assert_equal klass.send(field), value, "#{klass_name} does not have a default value of '#{value}' for '#{field}'"
      end
    end
  end
end
 
class ActiveSupport::TestCase
  extend HaveDefaultValue
end
