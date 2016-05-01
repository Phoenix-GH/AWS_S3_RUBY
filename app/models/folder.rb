class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :documents, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
