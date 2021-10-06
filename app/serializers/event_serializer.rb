class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_type, :additional_information

  def additional_information
    JSON.parse(object.additional_data)
  end

end
