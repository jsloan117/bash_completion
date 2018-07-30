# bash_completion

## How to install

---

If you do not have a bash_completion.d directory, copy them to where ever you want and source them via one of your .profile, .bashrc, etc files.

```bash
# git clone https://github.com/jsloan117/bash_completion
# mv -v bash_completion/*.bash /etc/bash_completion.d
```

---

- kitchen_completion.bash -- Arguments starting with '-' are NOT smartly filtered on a per command basis at this time. Please know which arguments go with which commands. I believe you will not need to use them most of the time, but I wanted to be able to execute commands on nodes.

e.g.

```bash
# kitchen exec default-centos7 <tab><tab>
# -c -p -l -D -t -a -P --create-gemfile --no-create-gemfile -b -j -d
# kitchen help exec
Usage:
  kitchen exec INSTANCE|REGEXP -c REMOTE_COMMAND

Options:
  -c, [--command=COMMAND]                      # execute via ssh
  -l, [--log-level=LOG_LEVEL]                  # Set the log level (debug, info, warn, error, fatal)
      [--log-overwrite], [--no-log-overwrite]  # Set to false to prevent log overwriting each time Test Kitchen runs
      [--color], [--no-color]                  # Toggle color output for STDOUT logger

Execute command on one or more instance
```
