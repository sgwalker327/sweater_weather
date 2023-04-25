class ActivitiesSerializer
  include JSONAPI::Serializer
  set_id { nil }
  attributes :activities, :destination, :forecast
end