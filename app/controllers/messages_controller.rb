class MessagesController < ApplicationController
  
  before_action :set_message, only: [:show, :edit, :update, :destro]
  
    def index
        @messages=Message.order(id: :desc).all.page(params[:page]).per(10)
    end
    
    def show
         
    end
    
    def new
        @message = Message.new
    end
    
    def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
    end
    
    def edit
      
    end
    
    def update
    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
    end
    
    def destroy #redirect_to
        @message.destroy
        
        flash[:success]='Messageは正常に削除されました'
        redirect_to message_url 
    end
    
    private
    
    def set_message
      @message=Message.find(params[:id])
    end
    
    def message_params
    params.require(:message).permit(:content, :title)
    end
        
end
