class CreateSubjects < ActiveRecord::Migration
  def up
      create_table :subjects do |t|
        t.integer "subject_id"
        #same as: t.references :subject
        t.string "name"
        t.integer "position"
        t.boolean "visible", :default => false
        t.timestamps
      end
        add_index("pages","subject_id")
        add_index("pages","permalink")
  end
  def down
      drop_table :subjects
  end
end
