{ config, lib, pkgs, ... }:

{
  home.username = "frain";
  home.homeDirectory = "/Users/frain";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # environment.
  home.packages = [
    pkgs.volta
    pkgs.eza
    pkgs.ripgrep
    pkgs.obsidian
    pkgs.fd
  ];

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
    LANG = "ja_JP.UTF-8";
    VOLTA_HOME="$HOME/.volta";
  };

  home.sessionPath = [
    "$VOLTA_HOME/bin"
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # vim
  programs.neovim.enable = true;
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    extraConfig = ''
      " .vimrc
      source $HOME/.config/vim/vimrc
    '';
  };

  # shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    # alias
    shellAliases = {
      e = "eza --icons --git";
      l = "e";
      ls = "e";
      ea = "eza -a --icons --git";
      la = "ea";
      ee = "eza -aahl --icons --git";
      ll = "ee";
      et = "eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons";
      lt = "et";
      eta = "eza -T -a -I 'node_modules|.git|.cache' --color=always --icons | less -r";
      lta = "eta";
      cdrepo = "cd `ghq root`/`ghq list | sk`";
    };
  };

  # starship
  programs.starship = {
    enable = true;
    settings = {

      format = lib.concatStrings [
        "[░▒▓](#9b72b0)[ 🕹️$username$hostname ](bg:#9b72b0)[](bg:#ffb86c fg:#9b72b0)"
        "$directory[](bg:#ff79c6 fg:#ffb86c)"
        "$git_branch$git_commit[](bg:#ff5555 fg:#ff79c6)"
        "$git_state$git_metrics$git_status[](fg:#ff5555)"
        "\n"
        "$character"
      ];

      right_format = "$all";

      line_break = {
        disabled = true;
      };

      directory = {
        style = "fg:#1d2230 bg:#ffb86c";
        format = "[ $path ]($style)";
        truncation_length = 5;
        truncation_symbol = "…/";
        fish_style_pwd_dir_length = 3;
      };

      # drucla theme
      aws = {
        style = "bold #50fa7b";
      };
      character = {
        error_symbol = "[»](bold #ff5555)";
        success_symbol = "[»](bold #f8f8f2)";
      };
      cmd_duration = {
        style = "bold #f1fa8c";
      };
      git_branch = {
        symbol = "";
        style = "fg:#1d2230 bg:#ff79c6";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "bright-white fg:#1d2230 bg:#ff5555";
        format = "[ $all_status$ahead_behind ]($style)";
        conflicted = "⚔️";
        ahead = "🏎️💨×\${count}";
        behind = "🐢×\${count}";
        diverged = "🔱🏎️💨×\${ahead_count} 🐢×\${behind_count}";
        untracked = "🛤️×\${count}";
        stashed = "";
        modified = "×\${count}";
        staged = "🗃️×\${count}";
        renamed = "📛×\${count}";
        deleted = "🗑️×\${count}";
      };
      hostname = {
        style = "bold #bd93f9";
      };
      username = {
        format = "[$user]($style) on ";
        style_user = "bold #8be9fd";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#1d2230";
        format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
      };

      # Language specific settings 
      nodejs = {
        format = "[ $symbol($version) ]($style)";
      };
      python = {
        format = "[ $symbol($version) ]($style)";
      };
      ruby = {
        format = "[ $symbol($version) ]($style)";
      };
      rust = {
        format = "[ $symbol($version) ]($style)";
      };
      golang = {
        format = "[ $symbol($version) ]($style)";
      };
      java = {
        format = "[ $symbol($version) ]($style)";
      };
      php = {
        format = "[ $symbol($version) ]($style)";
      };
      package = {
        format = "[ $symbol($version) ]($style)";
      };
      gradle = {
        format = "[ $symbol($version) ]($style)";
      };
      docker_context = {
        format = "[ $symbol$context ]($style)";
      };
    };
  };

  # skim
  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };
}
