class Task < ActiveRecord::Base
  validates :title, presence: true #need to validate unique within a project but haven't done associations yet
  belongs_to :project

  scope :completed, -> {where(done: true)}
  scope :incomplete, -> {where(done: false)}
end
