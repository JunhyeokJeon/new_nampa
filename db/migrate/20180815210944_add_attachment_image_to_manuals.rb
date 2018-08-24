class AddAttachmentImageToManuals < ActiveRecord::Migration[5.0]
  def self.up
    change_table :manuals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :manuals, :image
  end
end
