class TutorialFacade < SimpleDelegator
  def initialize(tutorial, video_id = nil)
    super(tutorial)
    @video_id = video_id
    @tutorial = tutorial
  end

  def current_video
    if @video_id
      videos.find(@video_id)
    elsif @tutorial.videos.none?
      @tutorial.videos.new(title: 'Sorry, no videos have been added for this tutorial')
    else
      videos.first
    end
  end

  def next_video
    videos[current_video_index + 1] || current_video
  end

  def play_next_video?
    !(current_video.position >= maximum_video_position)
  end

  private

  def current_video_index
    videos.index(current_video)
  end

  def maximum_video_position
    videos.max_by { |video| video.position }.position
  end
end