class Notice < ActiveRecord::Base
    belongs_to :user
    has_many :notice_comments
    
    resourcify
    
end
