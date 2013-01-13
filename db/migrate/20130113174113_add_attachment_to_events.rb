class AddAttachmentToEvents < ActiveRecord::Migration
  def change
      add_attachment :events, :pic
  end
end
