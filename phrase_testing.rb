class PhraseTesting < Phrases
  def phrase_security?
    phrase_long_enough? &&
    spaces? &&
    uppercase? &&
    lowercase?
  end
end
