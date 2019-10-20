#!/bin/zsh
mv ~/.cache/zsh/.zsh_history ~/.cache/zsh/.zsh_history_bad
strings ~/.cache/zsh/.zsh_history_bad > ~/.cache/zsh/.zsh_history
fc -R ~/.cache/zsh/.zsh_history
rm ~/.cache/zsh/.zsh_history_bad
