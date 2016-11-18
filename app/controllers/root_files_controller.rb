class RootFilesController < ApplicationController
  before_action :set_root_file, only: [:show, :edit, :update, :destroy]

  layout 'root_files'

  def index

    @success = RootLog.success
    @failed = RootLog.failed
    @category = params[:category]
    if params[:category] == 'invalid'
      @root_files = RootFile.where('category is null or category < 0')
    elsif params[:category] == 'valid'
      @root_files = RootFile.where('category is not null and category >= 0')
    else
      @root_files = RootFile.all
    end
    # respond_with(@root_files)
  end

  def show
  end

  def new
    @root_file = RootFile.new
  end

  def edit
  end

  def create
    @root_file = RootFile.new(root_file_params)
    respond_to do |format|
      if @root_file.save
        format.html { redirect_to @root_file, notice: 'Root 方案添加成功.' }
      else
        format.html { render :new, notice: 'Root 方案添加失败.'}
      end
    end

  end

  def update
    respond_to do |format|
      if @root_file.update(root_file_params)
        format.html { redirect_to @root_file, notice: 'Root 方案更新成功.' }
      else
        format.html { render :edit, notice: 'Root 方案更新失败.'}
      end
    end

  end

  def destroy
    @root_file.destroy
    redirect_to root_files_url
  end

  private
    def set_root_file
      @root_file = RootFile.find(params[:id])
    end

    def root_file_params
      params.require(:root_file).permit(:file, :source_name, :execute_params, :sort_num, :category,:keyword,:status, :sdk_api_version)
    end
end
