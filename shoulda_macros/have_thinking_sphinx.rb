# attribution: this came from http://www.agilmente.eu/2009/4/25/should_have_thinking_sphinx_index

module HaveThinkingSphinx

  def should_have_thinking_sphinx_index(*fields)
    klass = model_class

    should "be indexed by TinkingSphinix" do
      assert ThinkingSphinx.indexed_models.include?(klass.to_s)
    end

    if not fields.empty?
      indexed_fileds = klass.sphinx_indexes[0].fields.collect do |f|
        f.columns[0].__stack.empty? ? f.columns[0].__name : f.alias
      end.compact
      fields.each do |field|
        should "index #{field}" do
          assert indexed_fileds.include?(field)
        end
      end
    end
  end
end

class ActiveSupport::TestCase
  extend HaveThinkingSphinx
end
