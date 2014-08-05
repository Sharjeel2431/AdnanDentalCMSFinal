Rails.application.routes.draw do

  resources :tbl_slide_setting_bridges

  resources :tbl_slide_settings

  resources :tbl_layers

  resources :tbl_slide_layers

  resources :tbl_slide_transitions

  resources :transitions

  resources :tbl_banner_slides

  resources :tbl_slides

  resources :tbl_place_holder_contents

  resources :tbl_layout_placeholders

  resources :tbl_place_holders

  resources :tbl_globals

  resources :tbl_form_field_helpers

  resources :tbl_configs

  resources :tbl_banner_media

  resources :tbl_page_forms

  resources :tbl_form_fields

  resources :tbl_forms

  resources :tbl_media

  resources :tbl_banners

  resources :tbl_page_banners

  resources :tbl_pic_settings

  resources :tbl_page_categories

  resources :tbl_categories

  resources :tbl_page_contents

  resources :tbl_contents

  resources :tbl_pages

  resources :tbl_layouts

  resources :tbl_logins

  get 'tbl_slides/:id/settings/:id' => 'tbl_slides#settings', as: :settingslides
  get 'slider/index'
  get 'tbl_layers/new/:id' => 'tbl_layers#new', as: :layersnew
  get 'tbl_slides/:id/edit/:id' => 'tbl_slides#edit', as: :slidesedit
  get 'tbl_slides/new/:id' => 'tbl_slides#new', as: :slide
  get 'tbl_banners/:id/edit/:id' => 'tbl_banners#edit', as: :editbanners
  get 'tbl_contents/new/:id' => 'tbl_contents#new', as: :zzz
  get 'place_holder_news/index' => 'place_holder_new#index', as: :ada
  get 'tbl_contents/:id/edit/:id' => 'tbl_contents#edit', as: :editcontent

  get "log_out" => "cms#logout", :as => "log_out"

  get 'myaccount' => 'cms#myaccount', :as => 'myaccount'

  get '/tbl_place_holders/new/:id' => 'tbl_place_holders#new' , as: :newplaceholder

  get 'edit/:id' => 'tbl_layouts#edit', as: :editlayout

  get ':id/edit/:id' => 'tbl_pages#edit', as: :edit

  get '/tbl_contents/new/:id' => 'tbl_contents#new' , as: :new
  get '/tbl_banners/new/:id' => 'tbl_banners#new' , as: :newbanner


  get 'cm/cm'

  # routes for pages

 @pageinfo=TblPage.all
 @pageinfo.each do |index|

    @LayoutID=index.LayoutID
    @PageTitle=index.PageTitle
    @PageID=index.PageID
    @Status=index.Status

 @layoutinfo=TblLayout.where(LayoutID: @LayoutID)

    @layoutinfo.each do |index|

         @OnStateTag=index.OnStateTag

         #routes define on the basis of
         #OnStateTag field present in layout's table

            if @OnStateTag == "FW"
                  get 'FW/'+@PageTitle+'/:id' =>'vol#Volunteers'
            end

            if @OnStateTag == "H"
              get 'H'+'/'+@PageTitle+'/:id' => 'home#Home'
            end

            if @OnStateTag == "A"
              get 'A/'+@PageTitle+'/:id' => 'about_us#AboutUs'
            end

            if @OnStateTag == "AL"
              get 'AL/'+ @PageTitle+'/:id' => 'al_orthodontics#Orthodontics'
            end
             #get 'AL'+'/'+ @PageTitle+'/:id' => 'al_orthodontics#Orthodontics'
            # get 'AL'+'/'+ @PageTitle+'/:id' => 'cosmeticdentistry#Cosmeticdentistry'
            # get 'AL'+'/'+ @PageTitle+'/:id' => 'odontology#Odontology'
            # get 'AL'+'/'+ @PageTitle+'/:id' => 'endodontics#Endodontics'
            # get 'AL'+'/'+ @PageTitle+'/:id' => 'pedodontics#Pedodontics'
            # get 'AL'+'/'+ @PageTitle+'/:id' => 'periodontology#Periodontology'
         if @OnStateTag == "C"
             get 'C/'+ @PageTitle+'/:id' => 'contact_us#ContactUs'
         end
          if @OnStateTag == "FQ"

            get 'FQ'+'/'+ @PageTitle+'/:id' => 'faq#Faq'
          end



      end
    end



 #get 'AL/Periodontology/:id' => 'periodontology#Periodontology', as: :Periodontologyroute
#  get 'AL/Pedodontics/:id' => 'pedodontics#Pedodontics', as: :Pedodonticsroute
 # get 'AL/Endodontics/:id' => 'endodontics#Endodontics', as: :Endodonticsroute
  #get 'AL/Odontology/:id' => 'odontology#Odontology', as: :Odontologyroute
 # get 'AL/Cosmeticdentistry/:id' => 'cosmeticdentistry#Cosmeticdentistry', as: :cosmeticroute
  #get 'AL/Orthodontics/:id' => 'al_orthodontics#Orthodontics', as: :orthodonticsroute
 # get 'C/ContactUs/:id' => 'contact_us#ContactUs', as: :contactusroute
  #get 'FQ/Faq/:id' => 'faq#Faq', as: :faqroute
  #get 'FW/Volunteers/:id' => 'vol#Volunteers', as: :volunteerroute
  #get 'A/AboutUs/:id' => 'about_us#AboutUs', as: :aboutusroute
  #get 'H/Home/:id' => 'home#Home', as: :homeroute






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#Home'

  resources :tbl_cms
    post 'cm/processlogin'

resources :cms do
  collection do
    get 'index'
  end
  post 'processlogin', :on => :collection
end
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
