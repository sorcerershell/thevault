class Document < ActiveRecord::Base
  mount_uploader :file, FileUploader
  has_paper_trail
  
  belongs_to :group
  belongs_to :user
  belongs_to :category
  
  attr_accessible :description, :title, :year, :group_id, :user_id, :category_id, :file

  has_many :event_logs, as: :event_source
end
