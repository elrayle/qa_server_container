class UpdatePerformanceHistoryTable < ActiveRecord::Migration[5.1]
  def self.up
    change_column :performance_history, :action, :integer
    rename_column :performance_history, :load_time_ms, :retrieve_plus_graph_load_time_ms
    add_column :performance_history, :retrieve_time_ms, :float, after: :size_bytes
    add_column :performance_history, :graph_load_time_ms, :float, after: :retrieve_time_ms
    add_column :performance_history, :action_time_ms, :float
    add_index :performance_history, :action
  end

  def self.down
    remove_index :performance_history, :action
    remove_column :performance_history, :action_time_ms
    remove_column :performance_history, :retrieve_time_ms
    remove_column :performance_history, :graph_load_time_ms
    rename_column :performance_history, :retrieve_plus_graph_load_time_ms, :load_time_ms
    change_column :performance_history, :action, :string
  end
end
