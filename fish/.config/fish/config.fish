if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Configure theme (Rosé Pine)
fish_config theme choose rose-pine

# Init starship
starship init fish | source
