class ContentResource < JSONAPI::Resource
  attributes :name, :value
  has_one :paper

  filter :paper
end