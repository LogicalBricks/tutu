class PrestadoresController < ApplicationController
  # GET /prestadores
  # GET /prestadores.json
  def index
    @prestadores = Prestador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prestadores }
    end
  end

  # GET /prestadores/1
  # GET /prestadores/1.json
  def show
    @prestador = Prestador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prestador }
    end
  end

  # GET /prestadores/new
  # GET /prestadores/new.json
  def new
    @prestador = Prestador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prestador }
    end
  end

  # GET /prestadores/1/edit
  def edit
    @prestador = Prestador.find(params[:id])
  end

  # POST /prestadores
  # POST /prestadores.json
  def create
    @prestador = Prestador.new(params[:prestador])

    respond_to do |format|
      if @prestador.save
        format.html { redirect_to @prestador, notice: 'Prestador was successfully created.' }
        format.json { render json: @prestador, status: :created, location: @prestador }
      else
        format.html { render action: "new" }
        format.json { render json: @prestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prestadores/1
  # PUT /prestadores/1.json
  def update
    @prestador = Prestador.find(params[:id])

    respond_to do |format|
      if @prestador.update_attributes(params[:prestador])
        format.html { redirect_to @prestador, notice: 'Prestador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestadores/1
  # DELETE /prestadores/1.json
  def destroy
    @prestador = Prestador.find(params[:id])
    @prestador.destroy

    respond_to do |format|
      format.html { redirect_to prestadores_url }
      format.json { head :no_content }
    end
  end
end
