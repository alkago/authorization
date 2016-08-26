Rails.application.routes.draw do
  
  
  root 'home#main'
  
  get '/home/index' => 'home#index'
  
  #마법의 route
  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'

  devise_for :users

  get '/home/navbar'
  
  #정환 - FAQ
  get '/faq' => 'home#jf_faq'
  
  #정환 - 공지
  get '/notice_master' => 'home#jf_notice_master'
  
  get '/notice' => 'home#jf_notice'
  get '/notice/:notice_id' => 'home#jf_notice_content'
  
  
  get '/notice_input' => 'home#jf_notice_input'
  get '/notice_update_view/:notice_id' => 'home#jf_notice_update_view'
  post '/notice_update/:notice_id' => 'home#jf_notice_update'
  
  #공지 댓글
  post '/notice_comment' => 'home#jf_notice_comment_write'
  
  #notice_id 라는 비둘기를 라우터에서 지정해주는 경우라 할 수 있겠네
  get '/notice_destroy/:notice_id' => 'home#jf_notice_destroy'
  post '/notice_input_sent' => 'home#jf_notice_input_sent'
  
  #이벤트
  get '/event' => 'hocme#jf_event'
  
  #주성 
  get 'home/js_magazine'
  get 'home/js_magazine_v'
  get 'home/js_magazine_p'
  get 'home/js_tester'
  
  
  #지혜
  get '/qna' => 'system#qna'
  get '/myorder' => 'system#myorder'
  get '/mypage' => 'system#mypage'
  
  #get '/url' => 'controller#def'

  
  #상효
  get 'home/modal'
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
