class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def create
    @folder = current_user.folders.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to folders_path, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_path, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def index
    @folders = current_user.folders.all
  end

  def new
    @folder = current_user.folders.new
  end

  def show
  end

  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to folders_path, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_document_folder
    document = current_user.documents.find(params[:doc_id])
    status = document.update(folder_id: params[:folder_id]) ? 'success' : 'failure'
    respond_to do |format|
      format.json { render json: {status: status} }
    end
  end

  private
    def folder_params
      params.fetch(:folder, {}).permit!
    end

    def set_folder
      @folder = current_user.folders.find(params[:id])
    end
end
