module HaveDefaultValue
  def should_have_default_value(field, value = nil)
    klass = self.name.gsub(/Test$/, '').constantize
 
    context "#{klass}" do
      should "have a default value of '#{value}'" do
          assert_equal klass.new.send(field), value, "#{klass} does have a default value of '#{value}'"
      end
    end
  end
end
 
class ActiveSupport::TestCase
  extend HaveDefaultValue
end
