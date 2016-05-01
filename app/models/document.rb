class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder

  mount_uploader :attachment, AttachmentUploader

  validates :name, presence: true, uniqueness: true
  validates :attachment, presence: true

end