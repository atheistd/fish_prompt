# README
## This is my how my fish_prompt looks like




 - If `hostname: USER ▶ pwd` fits on a single line;

```
─┬─[ hostname: user ▶ pwd ]
 ├─[ 🐍 venv_name ]
 ├─[ proj_name ▶ git_prompt ]
 ╰─> 
```
> with `git` **and** `virtual_env`

```
─┬─[ hostname: user ▶ pwd ]
 ╰─> 
```
> without `git` **and** `virtual_env`<br>



- If *`hostname: user ▶ pwd`* doesn't fit on a single line but `pwd` does;

```
─┬─[ hostname: user ]
 ├─[ pwd ]
 ╰─> 
```
> without `git` **and** `virtual_env`<br>



- If `pwd` is too long to fit onto a single line;

```
─┬─[ hostname: user ]
 ├─[ dirname (prompt_pwd)/↴ ]
 ├─[ ↳ basename (pwd) ]
 ╰─> 
```		
> without `git` **and** `virtual_env`<br>
