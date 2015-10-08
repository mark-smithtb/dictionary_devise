require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase
  test "definitions without words are invalid" do
    definition = Definition.new(meaning: 'foobar')
    refute definition.valid?
  end

  test "definitions with words are valid" do
    definition = Definition.new(word: 'foo', meaning: 'foobar')
    assert definition.valid?
  end

  test "definitions without meanings are invalid" do
    definition = Definition.new(word: 'foo')
    refute definition.valid?
  end

  test "definations with meanings are valid" do
    definition = Definition.new(word: 'foo', meaning: 'foobar')
    assert definition.valid?
  end

  test "definations with words that are not unique are invalid" do
    definition_1 = Definition.create(word: 'foo', meaning: 'foobar')
    definition_2 = Definition.create(word: 'foo', meaning: 'foobar')
    refute definition_2.valid?
  end
  test "defintions with words that are unique are valid" do
    definition_1 = Definition.create(word: 'foo', meaning: 'foobar')
    definition_2 = Definition.create(word: 'foobar', meaning: 'foobar')
    assert definition_2.valid?
  end
  test "Definition who's word length is 17 or more should be considered fancy" do
    definition = Definition.create(word: 'accountabilitiess', meaning: 'Education. a policy of holding schools and teachers accountable for students academic progress by linking such progress with funding for salaries, maintenance, etc.')
    assert definition.fancy?, "A 16 letter word should be fancy."
  end
  test "Definitions who's word length is less that 17 should not be considered fancy" do
    definition = Definition.create(word: 'foo', meaning: 'foobar')
    refute definition.fancy?, "A word with less than 16 letters should not be fancy."
  end

  test "search returns correct defintion based on argument." do
    definition = Definition.create(word: 'foo', meaning: 'foobar')
    search = 'foo'
    found_definition = Definition.search(search)

    assert found_definition == [definition]
  end
end
