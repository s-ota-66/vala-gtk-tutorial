namespace Jarvis {
    public class Window : Gtk.ApplicationWindow {
        public Window (Application app) {
            Object (
                application: app
            );
        }
        
        construct {
            title = "This is my vala test";
            window_position = Gtk.WindowPosition.CENTER;
            set_default_size (350, 80);

            var settings = new GLib.Settings ("com.github.s-ota-66.jarvis");
            move (settings.get_int ("pos-x"), settings.get_int ("pos-y"));
           

            show_all ();
        }
    }
}
