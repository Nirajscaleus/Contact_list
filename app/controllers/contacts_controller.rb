class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
     if @contact.save
      redirect_to @contact
     else
       render :new
     end
  end

  def edit 
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact
    else  
      render :edit
    end  
  end

  def destroy
    @contact  = Contact.find(params[:id])
    @contact.destroy

    redirect_to root_path notice: "contact has been deleted"
  end

  private
  def contact_params
   params.require(:contact).permit(:name, :phone, :email)
  end
end
