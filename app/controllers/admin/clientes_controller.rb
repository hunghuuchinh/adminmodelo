class Admin::ClientesController < ApplicationController

  respond_to :html
  def index
    @clientes = Cliente.all
  end
  def show
    @cliente = Cliente.find(params[:id])

    respond_with @cliente
  end
  def new
    @cliente = Cliente.new

    respond_with @cliente
  end
  def edit
    @cliente = Cliente.find(params[:id])
  end
  def create
    @cliente = Cliente.new(params[:cliente])
    flash[:notice] = 'Cliente cadastrado com sucesso !' if @cliente.save
    respond_with @cliente, :location => admin_cliente_path(@cliente)
  end
  def update
    @cliente = Cliente.find(params[:id])
    flash[:notice] = 'Cliente atualizado com sucesso !' if @cliente.save
    respond_with @cliente, :location =>admin_cliente_path (@cliente)
  end
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    repond_with @cliente, :location => admin_cliente_path
  end  
end
