class SystemController < ApplicationController
    
    
    def qna
    end
    
    # def mypage
    #     @myinfo = Info.where(user_id: current_user.id) 
    # end    
    
    def myorder
        @myorder = Info.where(user_id: current_user.id) 
    end
    
    
    def destroy
        @one_product = Info.find(params[:id])
        @one_product.destroy
        redirect_to "/system/myorder" 
    end    
    
end
