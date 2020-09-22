require 'minitest/autorun'
require_relative 'card_checker'

class CardCheckerTest < Minitest::Test
  def test_single_digit_strings_can_not_be_valid
    refute CardChecker.valid?('1')
  end

  def test_a_single_zero_is_invalid
    refute CardChecker.valid?('0')
  end

  def test_a_simple_valid_sin_that_remains_valid_if_reversed
    assert CardChecker.valid?('059')
  end

  def test_a_simple_valid_sin_that_becomes_invalid_if_reversed
    assert CardChecker.valid?('59')
  end

  def test_a_valid_canadian_sin
    assert CardChecker.valid?('055 444 285')
  end

  def test_invalid_canadian_sin
    refute CardChecker.valid?('055 444 286')
  end

  def test_invalid_credit_card
    refute CardChecker.valid?('8273 1232 7352 0569')
  end

  def test_valid_number_with_an_even_number_of_digits
    assert CardChecker.valid?('095 245 88')
  end

  def test_valid_strings_with_a_non_digit_included_become_invalid
    refute CardChecker.valid?('055a 444 285')
  end

  def test_valid_strings_with_a_non_digit_added_at_the_end_become_invalid
    refute CardChecker.valid?('059a')
  end

  def test_valid_strings_with_punctuation_included_become_invalid
    refute CardChecker.valid?('055-444-285')
  end

  def test_valid_strings_with_symbols_included_become_invalid
    refute CardChecker.valid?('055£ 444$ 285')
  end

  def test_single_zero_with_space_is_invalid
    refute CardChecker.valid?(' 0')
  end

  def test_more_than_a_single_zero_is_valid
    assert CardChecker.valid?('0000 0')
  end

  def test_input_digit_9_is_correctly_converted_to_output_digit_9
    assert CardChecker.valid?('091')
  end

  def test_strings_with_non_digits_is_invalid
    refute CardChecker.valid?(':9')
  end
end
