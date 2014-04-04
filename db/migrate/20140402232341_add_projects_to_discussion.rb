class AddProjectsToDiscussion < ActiveRecord::Migration
  def change
    add_reference :discussions, :project, index: true
  end
end
