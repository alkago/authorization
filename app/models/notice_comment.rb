class NoticeComment < ActiveRecord::Base
    belongs_to :notice
    belongs_to :user
    
    resourcify
    
end
