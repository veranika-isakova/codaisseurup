class Document < ApplicationRecord
  belongs_to :event

  mount_uploader :document, DocumentUploader
end
