public class Jarvis.HeaderBar : Gtk.HeaderBar {
    public Jarvis.Window main_window { get; construct; }

    public HeaderBar (Jarvis.Window window) {
        Object (
            main_window: window
        );
    }

    construct {
        show_close_button = true;

        var add_button = new Gtk.Button.with_label ("Add");
        add_button.get_style_context ().add_class ("suggested-action");
        add_button.valign = Gtk.Align.CENTER;


        add_button.clicked.connect (() => {
            open_dialog ();
        });

        pack_start (add_button);

        var menu_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        menu_button.valign = Gtk.Align.CENTER;

        var stack_switcher = new Gtk.StackSwitcher ();
        stack_switcher.stack = main_window.stack;
        set_custom_title (stack_switcher);

        pack_end (menu_button);
    }

    public void open_dialog () {
        var dialog = new Gtk.Dialog.with_buttons (
            "Add a New Note",
            main_window,
            Gtk.DialogFlags.MODAL |
            Gtk.DialogFlags.DESTROY_WITH_PARENT,
            "Custom Button", 1,
            "Second Button", 2, null
        );

        var label = new Gtk.Label ("This is the content of my Dialog");
        var content_area = dialog.get_content_area ();
        content_area.add (label);

        dialog.show_all ();
        dialog.present ();
    }
}