# Instructions for creating `env.zsh`

Because I want to keep secrets in `env.zsh`, I can't push that to github (or, not without risk or doing something to encrypt it). This is why `env.zsh` is included in `.gitignore`.

After installing / restoring your dotfiles, create a file `env.zsh` and add the following (where secrets are omitted and non-sensitive environment values are included):

```zsh
# Connect to Docker (Takeout) MySQL 5.7 instance
export MYSQL_TCP_PORT=3307

export OPENAI_API_KEY="your-secret-api-key"
```
