  #render_views

  it "Locked user can be unlocked by url" do
    @user.lock_access!
=begin
    user.reload.unlock_access!
    https://localhost:3001/d/users/unlock?unlock_token=q1f4KyCjkUUxv__Y4Yqn
    get :unlock, token: @user.reload.unlock_token
    get "users/unlock?#{@user.reload.unlock_token}"
=end
    @controller = controller = Devise::UnlocksController.new
    get :show, unlock_token: @user.reload.unlock_token
    expect(@response.status).to eq(200)
    byebug
    #expect(response).to redirect_to('/d/users/sign_in')
    puts "token=#{@user.reload.unlock_token}"
    login_as_user(@user)
    expect(@response.status).to eq(302)
    expect(@user.reload.failed_attempts).to eq(0)
    expect(@user.reload.unlock_token).to be_nil
  end
