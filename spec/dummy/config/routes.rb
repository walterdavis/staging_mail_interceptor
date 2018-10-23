Rails.application.routes.draw do

  get 'errors/do_500' => 'errors#do_500'
  get 'errors/do_ceal_not_authorized' => 'errors#do_ceal_not_authorized'
  get 'errors/do_cancan_access_denied' => 'errors#do_cancan_access_denied'
  get 'errors/do_cancan_auth_not_performed' => 'errors#do_cancan_auth_not_performed'
  get 'errors/do_ar_not_found' => 'errors#do_ar_not_found'
  get '/errors/do_ceal_invalid_key' => 'errors#do_ceal_invalid_key'

end
