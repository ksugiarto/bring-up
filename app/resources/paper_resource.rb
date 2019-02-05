class PaperResource < JSONAPI::Resource
  attributes :url
  has_many :contents, class_name: 'Content'
end