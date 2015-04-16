
class ChangeCollationForTagNames < ActiveRecord::Migration
  def up
    if ActsAsTaggableOn::Utils.using_mysql?
      execute('ALTER TABLE tags MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_bin;')
    end
  end
end
