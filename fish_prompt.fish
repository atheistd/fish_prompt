source ~/.config/fish/functions/aliases.fish

function check_len

    set return_color $argv[1]

    set -l desired_prompt '─┬─[' (prompt_hostname): $USER ▶ $PWD ']'
    set -l to_be_adjusted_with ' ├─[' (pwd) ']'
    set -l final_option ' ├─[' (dirname (pwd))'/↴ ]'

    set -l desired_prompt_used false
    set -l to_be_adjusted_with_used false

    set -l desired_prompt_len (string length -- "$desired_prompt")
    set -l to_be_adjusted_with_len (string length -- "$to_be_adjusted_with")
    set -l final_option_len (string length -- "$final_option")

    if test $desired_prompt_len -lt $COLUMNS
        set desired_prompt_used true
        normal_prompt $return_color
    end

    if test $desired_prompt_used = false
        # Above condition
        # that if `desired_prompt` already fits
        # the console or not
        modified $return_color

        if test $to_be_adjusted_with_len -lt $COLUMNS
            set to_be_adjusted_with_used true
            print_directory $return_color (pwd)
        end

        if test $to_be_adjusted_with_used = false
            if test $final_option_len -lt $COLUMNS
                print_directory $return_color (dirname (pwd))'/↴'
            else
                print_directory $return_color (dirname (prompt_pwd))'/↴'
            end
            print_directory $return_color '↳ '(basename (pwd))
        end

    end

end


function normal_prompt

    set return_color $argv[1]

    set_color $return_color
    echo -n '─┬─[ '

    set_color -o red
    echo -n (prompt_hostname)': '

    if test "$USER" = root
        set_color -o brred
    else
        set_color -o brwhite
    end
    echo -n $USER

    set_color -o brblack
    echo -n ' ▶ '

    set_color -o brcyan
    echo -n (pwd)

    set_color $return_color
    echo -n ' ]'
    set_color normal

end

function print_directory

    set return_color $argv[1]
    set dir $argv[2]

    echo
    set_color $return_color
    echo -n ' ├─[ '

    set_color -o brcyan
    echo -n $dir

    set_color $return_color
    echo -n ' ]'
    set_color normal

end

function modified

    set return_color $argv[1]

    set_color $return_color
    echo -n '─┬─[ '

    set_color -o red
    echo -n (prompt_hostname)': '

    if test "$USER" = root
        set_color -o brred
    else
        set_color -o brwhite
    end
    echo -n $USER

    set_color $return_color
    echo -n ' ]'

end

function custom_git

    set return_color $argv[1]
    set proj_name $argv[2]
    set proj_git $argv[3]

    echo
    set_color $return_color
    echo -n ' ├─[ '

    set_color normal
    echo -n $proj_name

    set_color brblack
    echo -n ' ▶ '

    set_color normal
    echo -n $proj_git

    set_color $return_color
    echo -n ' ]'

end

function custom_venv

    set return_color $argv[1]
    set venv_name $argv[2]

    echo
    set_color $return_color
    echo -n ' ├─[ '

    set_color normal
    echo -n '🐍 '

    set_color cyan
    echo -n $venv_name

    set_color $return_color
    echo -n ' ]'

end

function fish_prompt

    set -l return_color brblack
    test $status = 0; and set return_color bryellow

    echo
    check_len $return_color

    function _nim_prompt_wrapper
        set retc $argv[1]
        set cust $argv[4]
        set field_name $argv[2]
        set field_value $argv[3]

        set_color normal
        set_color $retc
        echo
        echo -n ' ├─'
        echo -n '[ '

        set_color normal
        test -n $field_name
        and echo -n $field_name

        set_color -o brblack
        echo -n ' ▶ '

        set_color $retc
        set_color $cust
        echo -n $field_value

        set_color $retc
        echo -n ' ]'
    end

    # Virtual Environment
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and custom_venv $return_color (basename "$VIRTUAL_ENV")

    # git
    set prompt_git (fish_git_prompt %s)
    test -n "$prompt_git"
    and custom_git $return_color (basename -s .git (git config --get remote.origin.url) 2> /dev/null) $prompt_git

    echo
    set_color normal
    for job in (jobs)
        set_color $retc
        echo -n ' │ '
        set_color brown
        echo $job
    end
    set_color $return_color
    echo -n ' ╰─> '
    set_color normal

end




set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showuntrackedfiles
set __fish_git_prompt_showupstream 'verbose'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_describe_style 'branch'

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_cleanstate ' 👍  '
set __fish_git_prompt_char_conflictedstate ' ⚠️  '
set __fish_git_prompt_char_dirtystate ' 💩  '
set __fish_git_prompt_char_invalidstate ' 🤮  '
set __fish_git_prompt_char_stagedstate ' 🚥  '
set __fish_git_prompt_char_stashstate ' 📦  '
set __fish_git_prompt_char_stateseparator ' | '
set __fish_git_prompt_char_untrackedfiles ' 🔍  '
set __fish_git_prompt_char_upstream_ahead ' ☝️  '
set __fish_git_prompt_char_upstream_behind ' 👇  '
set __fish_git_prompt_char_upstream_diverged ' 🚧  '
set __fish_git_prompt_char_upstream_equal ' 💯 '

