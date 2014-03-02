require "active_model/serializer"

ActiveModel::Serializer.class_eval do
  alias_method :orig_attributes, :attributes
  def attributes
    hash = orig_attributes
    hash[:errors] = object.errors.messages if object.errors.present?
    hash
  end
end
