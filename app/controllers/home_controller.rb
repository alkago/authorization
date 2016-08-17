class HomeController < ApplicationController
  def index
    
  end
  def js_magazine
  end
  def js_magazine_v
  end
  def js_magazine_p
  end
  
  def jf_faq
  end
  
  #정환 공지사항
  def jf_notice_master
    @jf_notice_view = Notice.all.reverse
  end
  
  def jf_notice
  
    @jf_notice_view = Notice.all.reverse
  
  end
  
  def jf_notice_content
    @jf_notice_view = Notice.all.reverse
    @existing_notice = Notice.find(params[:notice_id])
  end

  def jf_notice_input
  end
  
  def jf_notice_input_sent
    jf_notice_write = Notice.new
    jf_notice_write.title = params[:jf_notice_title]
    jf_notice_write.content = params[:jf_notice_content]
   
    # 사진은 따로 .file 받지는 않는듯.
    uploader = JfNoticeImageUploader.new 
    uploader.store!(params[:jf_notice_file])
    jf_notice_write.image_url = uploader.url
    
    jf_notice_write.save
    
    
    redirect_to '/notice'
  end
  
  def jf_notice_comment_write
    
    comment = NoticeComment.new
    comment.notice_id = params[:notice_id_comment]
    comment.content = params[:jf_notice_comment]
    comment.save
    #이런 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 모델에는 _가 들어가면 안됨. _를 넣어서 했다면 _ 이후 첫 알파벳 대문자 & _는 생략
    

    redirect_to '/notice'
  end
  
  def jf_notice_update_view
    @existing_notice = Notice.find(params[:notice_id])
  end
  
  def jf_notice_update
    @existing_notice = Notice.find(params[:notice_id])
    @existing_notice.title = params[:jf_notice_title_modified]
    @existing_notice.content = params[:jf_notice_content_modified]
    
    
    # 사진은 따로 .file 받지는 않는듯.
    uploader = JfNoticeImageUploader.new  # 여기서도 문제가 발생하네요. 수정시에 new 말고 find 해야하는데. 이거 어떻게 해야 하는지? 얘도 주소 지정? 업로더는 어떻게 하나요? 그냥 new?
    uploader.store!(params[:jf_notice_file])
    @existing_notice.image_url = uploader.url
    
    @existing_notice.save
    
    flash[:notice] ="수정되었습니다."
    
    redirect_to '/notice'
  end

  def jf_notice_destroy
    @existing_notice = Notice.find(params[:notice_id])
    @existing_notice.destroy
    redirect_to '/notice'
  end
end
