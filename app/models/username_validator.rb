class UsernameValidator < ActiveModel::EachValidator
  VALID_NAME_REGEX = /^[-\w\._]+$/i #/([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*/i
  
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "should only contain letters, numbers, underscore, hyphen") unless
      value=~VALID_NAME_REGEX
  end
end