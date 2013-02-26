class AddattachmentToEntries < ActiveRecord::Migration
  def change
    add_attachment :entries, :picture
  end
end
