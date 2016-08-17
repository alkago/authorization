class Notice < ActiveRecord::Base
    has_many :notice_comments
end
