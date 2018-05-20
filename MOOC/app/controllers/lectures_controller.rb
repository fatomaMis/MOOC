class LecturesController < InheritedResources::Base
  before_action :set_lecture, only: [:show, :edit, :update]

  def upvote 
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    redirect_back fallback_location: root_path
  end  
  
  def downvote
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_by current_user
    redirect_back fallback_location: root_path
  end
  
  def show 
    @comments = Comment.where(lecture_id: @lecture).order("created_at DESC")

  end

  
  def download
    send_file '#{Rails.root}/public/uploads/lecture/attachment/#{@lecture.id}/#{File.basename(@lecture.attachment_url)}'
  end




  def spam
    @lecture = Lecture.find(params[:id])
    check = Flag.where(:user_id => current_user.id,:lecture_id => @lecture.id).first
    if  Flag.exists?(user_id: current_user.id,lecture_id: @lecture.id)
      if check.action == true
        check.update(:action => 'false')
        respond_to do |format|
          format.html { redirect_to lecture_url, notice: 'Lecture was successfully unspammed.' }
          format.json { head :no_content }
        end
      else
        check.update(:action => 'true')
        @user=@lecture.user
       
        respond_to do |format|
          format.html { redirect_to lecture_url, alert: 'Lecture was successfully spammed.' }
          format.json { head :no_content }
        end
      end
    else
      @user=@lecture.user
      flag = Flag.new(:action => true,:user_id => current_user.id,:lecture_id => @lecture.id)
      flag.save
      
      respond_to do |format|
        format.html { redirect_to lecture_url, alert: 'Lecture was successfully spammed.' }
        format.json { head :no_content }
      end
    end
  end
  




  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end

    def set_lecture
      @lecture = Lecture.find(params[:id])
    end
    
end

