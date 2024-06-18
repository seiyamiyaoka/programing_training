class Admin::UsersController < AdminController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_user_path(@admin), notice: 'admin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_user_path(@admin), notice: 'admin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_users_url, notice: 'admin was successfully destroyed.'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
