class DocumentSerializers < ActiveModel::Serializer
  attributes :id, :file, :created_at, :updated_at, :file_urls, :sender_id, :recipient_id
end
