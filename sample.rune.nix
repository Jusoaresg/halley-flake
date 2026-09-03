# Import with: imports = [ (import ./sample.rune.nix inputs) ];
inputs:
{ ... }:
{
  programs.halley = {
    enable = true;

    settings = {
      autostart.once = [
        "blxshell"
        "waybar"
      ];

      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
        hide-when-typing = false;
      };

      env = {
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct";
      };

      font = {
        family = "Rubik";
        size = 14;
      };

      screenshot.directory = "$env.HOME/Pictures/Screenshots/";

      debug = {
        overlay-fps = false;
        show-ring-when-resizing = true;
      };

      apogee = {
        enabled = true;
        live-previews = false;
        transition-ms = 320;
        gap = 24;
        max-rows = 3;
        background-dim = 0.85;
      };

      background = {
        mode = "field-shader";
        shader = "space";
        colour = "#202233";
        accent-colour = "#9db7ee";
        intensity = 1.35;
        animated = false;
      };

      focus-ring = {
        primary-rx = 820;
        primary-ry = 420;
        offset-x = 0;
        offset-y = 0;
      };

      input = {
        repeat-rate = 30;
        repeat-delay = 500;
        focus-mode = "hover";
        keyboard = {
          layout = "us,ru,il";
          options = "grp:alt_shift_toggle";
        };
        gestures = {
          enabled = true;
          pinch-to-zoom = true;
          modifier = "$mod";
          pan-fingers = 3;
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
          accel-profile = "adaptive";
        };
        devices."Logitech MX Master 3" = {
          accel-speed = 0.6;
          natural-scroll = true;
        };
      };

      viewport."HDMI-A-1" = {
        enabled = true;
        width = 1920;
        height = 1080;
        rate = 180;
        vrr = "on";
        focus-ring = {
          primary-rx = 820;
          primary-ry = 420;
        };
      };

      field = {
        gap = 20;
        active-windows-allowed = 5;
        pins = {
          corner = "top-right";
          colour = "auto";
          background-colour = "auto";
          size = 1.0;
        };
        close-restore-focus = true;
        close-restore-pan = "if-offscreen";
        zoom = {
          enabled = true;
          step = 1.1;
          min = 0.35;
          max = 1.5;
        };
      };

      placement = {
        expanded = {
          strategy = "center";
          fallback = "center";
          find-empty-mode = "best-effort";
        };
        landmarks = {
          strategy = "nearest-free";
          normal-blocker = "relocate";
          pinned-blocker = "preserve";
        };
        reveal = {
          enabled = true;
          max-pan-px = 360;
          animation-ms = 180;
          pan-to-new = "if-needed";
        };
      };

      node = {
        show-labels = "hover";
        show-app-icons = "always";
        node-shape = "squircle";
        node-label-shape = "squircle";
        icon-size = 0.72;
        opacity = 1.0;
        background-colour = "auto";
        border-colour-hover = "use-window-active";
        border-colour-inactive = "use-window-inactive";
        click-collapsed-outside-focus = "activate";
        click-collapsed-pan = "if-offscreen";
      };

      decay = {
        active-delay = 240;
        inactive-delay = 120;
      };

      trail = {
        history-length = 25;
        wrap = true;
      };

      bearings = {
        show-distance = true;
        show-icons = true;
        show-pinned = true;
        fade-distance = 1200;
      };

      clusters = {
        cluster-dwell-ms = 2000;
        distance-px = 280.0;
        bloom-direction = "clockwise";
        show-icons = true;
        default-layout = "stacking";
      };

      tile = {
        new-on-top = false;
        gaps-inner = 20;
        gaps-outer = 20;
        max-stack = 4;
        queue-show-icons = true;
      };

      stacking.max-visible = 5;
      physics = {
        enabled = true;
        damping = 0.97;
      };

      animations = {
        enabled = true;
        smooth-resize = {
          enabled = true;
          duration-ms = 90;
        };
        maximize = {
          enabled = true;
          duration-ms = 240;
        };
        fullscreen = {
          enabled = true;
          duration-ms = 240;
        };
        window-open = {
          enabled = true;
          duration-ms = 620;
        };
        window-close = {
          enabled = true;
          duration-ms = 270;
          style = "shrink";
        };
        tile = {
          enabled = true;
          duration-ms = 240;
        };
        stack = {
          enabled = true;
          duration-ms = 220;
        };
        raise = {
          enabled = true;
          duration-ms = 140;
          scale = 1.025;
          shadow-boost = 0.18;
          trigger = "always";
        };
        cluster = {
          enabled = true;
          tiling = {
            open-duration-ms = 300;
            stagger-ms = 55;
            close-duration-ms = 420;
            reflow-duration-ms = 400;
          };
          stacking = {
            open-duration-ms = 240;
            close-duration-ms = 360;
          };
        };
      };

      effects.blur = {
        enabled = true;
        overlays = true;
        windows = "off";
        method = "dual-kawase";
        radius = 24;
        passes = 3;
      };

      effects.shadows = {
        window = {
          enabled = false;
          blur-radius = 40;
          spread = 2;
          offset-x = 0;
          offset-y = 5;
          colour = "#7eaba8";
        };
        node = {
          enabled = true;
          blur-radius = 14;
          spread = 0;
          offset-x = 0;
          offset-y = 3;
          colour = "#05030524";
        };
        overlay = {
          enabled = true;
          blur-radius = 24;
          spread = 1;
          offset-x = 0;
          offset-y = 7;
          colour = "#05030538";
        };
      };

      decorations = {
        border = {
          size = 3;
          radius = 20;
          colour-focused = "#a3d1b5";
          colour-unfocused = "#1e4834";
        };
        secondary-border = {
          enabled = false;
          size = 3;
          gap = 0;
          colour-focused = "#fabd2f";
          colour-unfocused = "#ffffff";
        };
        resize-using-border = true;
      };

      overlays = {
        background-colour = "auto";
        text-colour = "auto";
        error-colour = "#fb4934";
        shape = "square";
        borders = "true";
        border-source = "primary";
        blur = true;
      };

      keybinds = {
        mod = "super";
        "$var.mod+return" = "open-terminal";
        "$var.mod+d" = "fuzzel";
        "$var.mod+shift+r" = "reload";
        "$var.mod+q" = "close-focused";
        "$var.mod+mousewheelup" = "zoom-in";
        "$var.mod+mousewheeldown" = "zoom-out";
        "$var.mod+left" = [
          "node-move left"
          "tile-focus left"
          "stack-cycle forward"
        ];
      };

      rules.rule = [
        {
          app-id = "firefox";
          title.__raw = ''[r"File Upload.*", r"Open File.*", r"Save File.*"]'';
          spawn-placement = "center";
          cluster-participation = "float";
        }
        {
          app-id = [ "zen" "zen-beta" "zen-browser" ];
          width = 1280;
          height = 800;
          blur = true;
        }
      ];

      gamescope = {
        enabled = true;
        monitor = "focused";
        fullscreen = true;
        suppress-overlays = true;
        game = [
          {
            name = "Deep Rock Galactic";
            app-id = "steam_app_548430";
            enabled = true;
          }
        ];
      };

      gaming = {
        games = [ "steam_app_*" "tf_linux64" ];
        gamescope = {
          enabled = true;
          monitor = "focused";
          game = [
            {
              name = "Example Game";
              app-id = "example-game";
              enabled = true;
            }
          ];
        };
      };
    };
  };
}
