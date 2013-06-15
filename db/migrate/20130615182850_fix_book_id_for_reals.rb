class FixBookIdForReals < ActiveRecord::Migration
  def change
  	execute %q{
   	  alter table reviews
      alter column trip_id
      type int using cast(trip_id as int)
    }
  end
end
