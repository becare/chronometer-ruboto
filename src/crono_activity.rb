require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

# http://xkcd.com/378/

class CronoActivity
  java_import "android.os.SystemClock"
  java_import "android.view.Gravity"

    def on_create(bundle)
      ruboto_import_widgets :LinearLayout, :Button, :Chronometer
      super
      setTitle "Views/Chronometer"
      setContentView(
        linear_layout(:orientation => :vertical, :gravity => Gravity::CENTER_HORIZONTAL) do
          @c = chronometer :format => "Initial format: %s", :width => :wrap_content, :padding => [0,30,0,30] 
          button :text => "Start", :width => :wrap_content, :on_click_listener => proc{@c.start}
          button :text => "Stop", :width => :wrap_content, :on_click_listener => proc{@c.stop}
          button :text => "Reset", :width => :wrap_content, :on_click_listener => proc{@c.setBase SystemClock.elapsedRealtime}
        end)
    end
end


