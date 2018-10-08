class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.is_clickbait?
      record.errors[attribute] << (options[:message] || "is not clickbait")
    end
  end
end
