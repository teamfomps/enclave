class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.length > 0
    parsed_number = Phoner::Phone.parse(value)
    process_errors unless parsed_number.instance_of? Phoner::Phone
  rescue
    process_errors(record, attribute)
  end

  protected

  def process_errors(record, attribute)
    record.errors[attribute] << 'is not a valid phone number'
  end
end
