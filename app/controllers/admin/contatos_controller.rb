class Admin::ContatosController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html
  def index
    @contatos = Contato.all

    respond_with @contatos
  end
  def show
    @contato = Contato.find(params[:id])

    respond_with @contato
  end
  def new
    @contato = Contato.new
    respond_with @contato
  end
  def edit
    @contato = Contato.find(params[:id])
  end
  def create
    @contato = Contato.new(params[:contato])
    flash[:notice] = 'Contato was successfully created.' if @contato.save
    respond_with @contato, :location => admin_contato_path(@contato)
  end

  def update
    @contato = Contato.find(params[:id])
    flash[:notice] = 'Contato was successfully updated.' if @contato.update_attributes(params[:post])
    respond_with @contato, :location => admin_contato_path(@contato)
  end
  def destroy
    @contato = Contato.find(params[:id])
    @contato.destroy
    respond_with @contatos, :location => admin_contato_path
  end
end
