# encoding: utf-8
class LectoresController < ApplicationController
  # GET /lectores
  # GET /lectores.json
  def index
    @lectores = Lector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lectores }
    end
  end

  # GET /lectores/1
  # GET /lectores/1.json
  def show
    @lector = Lector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lector }
    end
  end

  # GET /lectores/new
  # GET /lectores/new.json
  def new
    @lector = Lector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lector }
    end
  end

  # GET /lectores/1/edit
  def edit
    @lector = Lector.find(params[:id])
  end

  # POST /lectores
  # POST /lectores.json
  def create
    @lector = Lector.new(params[:lector])

    respond_to do |format|
      if @lector.save
        format.html { redirect_to @lector, notice: 'El nuevo lector se ha guardado correctamente.' }
        format.json { render json: @lector, status: :created, location: @lector }
      else
        format.html { render action: "new" }
        format.json { render json: @lector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lectores/1
  # PUT /lectores/1.json
  def update
    @lector = Lector.find(params[:id])

    respond_to do |format|
      if @lector.update_attributes(params[:lector])
        format.html { redirect_to @lector, notice: 'Las modificaciones al Lector se han guardado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectores/1
  # DELETE /lectores/1.json
  def destroy
    @lector = Lector.find(params[:id])
    @lector.destroy

    respond_to do |format|
      format.html { redirect_to lectores_url }
      format.json { head :no_content }
    end
  end

  def foto
    @lector = Lector.find(params[:id])
  end

  def foto_url
    @lector = Lector.find(params[:id])
    render text: @lector.foto_url
  end

  def upload
    @lector = Lector.find(params[:id])
    path = upload_path
    File.open(path, 'wb') do |f|
      f.write request.raw_post
    end
    @lector.foto = File.open(path)
    @lector.save
    render :text => "ok"
  end

  def search
    @lectores = Lector.order('primer_apellido').
      finder(params[:q])#.page(params[:page]).per(params[:per])
    respond_to do |format|
      format.json { render json: @lectores.to_json}
    end
  end

  def credenciales
    if params[:lectores_ids].blank? or params[:lectores_ids].empty?
      redirect_to( lectores_path, alert: 'No ha seleccionado ningún lector' )
    else
      @lectores = Lector.find(params[:lectores_ids])
    end
  end

private

  def upload_path # is used in upload and create
    uuid = UUIDTools::UUID.random_create
    File.join(Rails.root, 'tmp', "#{uuid}.jpg")
  end

end
