class AddattachmentToSponsor < ActiveRecord::Migration
  def change
    add_attachment :sponsors, :image
  end
end
