class ManualsController < ApplicationController
  before_action :set_manual, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :log_impression, :only=> [:show]

  def log_impression
    @hit_manual = Manual.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_manual.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end

  def index
    if current_user.userspec
      @manuals = Manual.all
      sorting(@manuals)
    elsif
      @manuals = Manual.all.order("created_at DESC")
    end
  end

  def category
    @p = params[:category]
    @manuals = Manual.where(:category => @p)
    @manuals = @manuals.order("created_at DESC")
    # if current_user.userspec
    #   sorting(@manuals)
    # elsif
    #   @manuals = @manuals.order("created_at DESC")
    # end
  end

  def show
    @users = User.all
    @manual = Manual.find params[:id]
    impressionist(@manual)

  end

  def new
    @manual = current_user.manuals.build
  end

  def edit
  end

  def create
    @manual = current_user.manuals.build(manual_params)

    respond_to do |format|
      if @manual.save
        format.html { redirect_to @manual, notice: 'Manual was successfully created.' }
        format.json { render :show, status: :created, location: @manual }
      else
        format.html { render :new }
        format.json { render json: @manual.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @manual.update(manual_params)
        format.html { redirect_to @manual, notice: 'Manual was successfully updated.' }
        format.json { render :show, status: :ok, location: @manual }
      else
        format.html { render :edit }
        format.json { render json: @manual.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manual.destroy
    respond_to do |format|
      format.html { redirect_to manuals_url, notice: 'Manual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @manual.upvote_by current_user
    redirect_to :back
  end

  def sorting(manuals)
    @us= current_user.userspec
    @manuals = manuals
    @manualArray = Array.new(@manuals.count){Array.new(2)}
    keys = ['skintype', 'age', 'atopy', 'pimple', 'allergy', 'bb', 'lip', 'eyebrow', 'eyeline', 'color', 'skincolor']
    arrayIndex = 0

    # 매뉴얼스펙과 유저스펙 비교
    @manuals.each do |manual|
      @manualArray[arrayIndex][1] = manual.id
      @manualArray[arrayIndex][0] = 0

      for i in 0..10
        if @us[keys[i]]
          if @us[keys[i]] == manual[keys[i]]
            @manualArray[arrayIndex][0] += 1
          end
        end
      end
      arrayIndex += 1
    end

    # @manuals 재배열
    @manualArray = @manualArray.sort.reverse
    @manuals = []
    @manuals_best = []
    for i in 0..(@manualArray.length-1)
      if @manualArray[i][0] > 0
        if i < 4
          @manuals_best << Manual.find(@manualArray[i][1])
        else
          @manuals << Manual.find(@manualArray[i][1])
        end
      end
    end
  end

  private
  def set_manual
    @manual = Manual.find(params[:id])
  end

  def manual_params
    params.require(:manual).permit(:category, :title, :image, :content, :skintype, :age, :atopy, :pimple, :allergy, :bb, :lip, :eyebrow, :eyeline, :color, :skincolor)
  end
end
