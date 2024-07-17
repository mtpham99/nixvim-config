# markdown.nix
# markdown-preview plugin

{ ... }:

{
  plugins.markdown-preview = {
    enable = true;

    settings = {
      preview_options = {
        content_editable = true;
        disable_filename = false;
        disable_sync_scroll = false;
        sync_scroll_type = "middle";
        hide_yaml_meta = true;
      };
    };
  };
}
