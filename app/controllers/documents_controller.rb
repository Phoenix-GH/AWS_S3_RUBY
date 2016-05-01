class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def create
    @folder = current_user.folders.find(params[:folder_id]) if params[:folder_id].present?
    @document = (@folder.present? ? @folder.documents : current_user.documents).new(document_params)
    path = @folder.present? ? folder_path(@folder) : folders_path

    respond_to do |format|
      if @document.save
        format.html { redirect_to path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to folders_path, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def index
    @documents = current_user.documents
  end

  def new
    @document = if params[:folder_id]
      current_user.folders.find(params[:folder_id]).documents.new
    else
      current_user.documents.new
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def document_params
      params.fetch(:document, {}).permit!
    end

    def set_document
      @document = current_user.documents.find(params[:id])
    end
end
