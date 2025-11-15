{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.tools.zellij;
in {
  options.apps.tools.zellij = with types; {
    enable = mkBoolOpt false "Enable zellij";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
    };
    xdg.configFile."zellij/config.kdl".text = ''
      keybinds {
          normal clear-defaults=true {
              // tmux
              bind "Ctrl a" { SwitchToMode "Tmux"; }
              unbind "Ctrl b"
              // general stuff
              bind "Ctrl Left" { NewPane "Left"; }
              bind "Ctrl Right" { NewPane "Right"; }
              bind "Ctrl Up" { NewPane "Up"; }
              bind "Ctrl Down" { NewPane "Up"; }
              bind "Ctrl x" { CloseFocus; SwitchToMode "Normal"; }
              bind "Ctrl w" { ToggleFloatingPanes;}
              bind "Ctrl t" { NewTab;}
              bind "Ctrl h" { MoveFocusOrTab "Left"; }
              bind "Ctrl l" { MoveFocusOrTab "Right"; }
              bind "Ctrl j" { MoveFocus "Down"; }
              bind "Ctrl k" { MoveFocus "Up"; }
              bind "Ctrl =" { Resize "Increase"; }
              bind "Ctrl -" { Resize "Decrease"; }
              bind "Ctrl [" { PreviousSwapLayout; }
              bind "Ctrl ]" { NextSwapLayout; }
              bind "Ctrl i" { MoveTab "Left"; }
              bind "Ctrl o" { MoveTab "Right"; }
          }
          tmux clear-defaults=true {
              bind "Ctrl a" { Write 2; SwitchToMode "Normal"; }
              bind "Esc" { SwitchToMode "Normal"; }
              bind "g" { SwitchToMode "Locked"; }
              bind "p" { SwitchToMode "Pane"; }
              bind "t" { SwitchToMode "Tab"; }
              bind "n" { SwitchToMode "Resize"; }
              bind "h" { SwitchToMode "Move"; }
              bind "s" { SwitchToMode "Scroll"; }
              bind "o" { SwitchToMode "Session"; }
              bind "q" { Quit; }
          }
      }


      // Plugin aliases - can be used to change the implementation of Zellij
      // changing these requires a restart to take effect
      plugins {
          compact-bar location="zellij:compact-bar"
          configuration location="zellij:configuration"
          filepicker location="zellij:strider" {
              cwd "/"
          }
          plugin-manager location="zellij:plugin-manager"
          session-manager location="zellij:session-manager"
          status-bar location="zellij:status-bar"
          strider location="zellij:strider"
          tab-bar location="zellij:tab-bar"
          welcome-screen location="zellij:session-manager" {
              welcome_screen true
          }
          autolock location="https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm" {
              triggers "nvim|vim|v|nv"  // Lock when any open these programs open. They are expected to unlock themselves when closed (e.g., using zellij.vim plugin).
              watch_triggers "fzf|zoxide|atuin|atac"  // Lock when any of these open and monitor until closed.
              watch_interval "5.0"  // When monitoring, check every X seconds.
          }
      }

      load_plugins {
        welcome-screen
        autolock
      }

      default_mode "normal"
    '';
  };
}
