# markdown.nix
# markdown-preview plugin

{ ... }:

{
  plugins.markdown-preview = {
    enable = true;

    settings = {
      preview_options = {
        content_editable = 1;
        disable_filename = 0;
        disable_sync_scroll = 0;
        sync_scroll_type = "middle";
        hide_yaml_meta = 1;
      };
    };
  };
}
