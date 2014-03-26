class Task < ActiveRecord::Base
  validates :title, presence: true #need to validate unique within a project but haven't done associations yet
end
