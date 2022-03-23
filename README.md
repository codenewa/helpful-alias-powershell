# helpful-alias-powershell
Some helpfule powershell alias.

## Steps
1. Create tools folder under c:
2. Add clean.ps1, find.ps1, and start-as-admin.ps1 in c:\tools.
3. in start-as-admin.ps1, update your credentials. //TODO: might be possible to use encrypted password since it's in risk of being exposed. 
4. save profile.ps1 to `c:\windows\system32\windowspowershell\v1.0`
5. Restart your powershell


## What's available
1. `find`: recursive search in a directory
2. `admin`: start following tools in admin mode: 
    1. `np`: notepad++
    2. `code`: vscode
    3. `wt`: windows terminal
4. `clean`: Deep clean of everything in a visual studio solution folder. Deletes `bin`, `obj`, `packages`, also cleans `temp` folders, and `nuget cache`. 
5. `vs <solutionfile>`: open solution in vs2022.
6. `vs19 <solutionFile>`: open solution in vs2019.
7. `e`: Shortcut for explorer.
8. `passwd`: this saves the admin password in an encrypted file. Use the `-admin` switch to set the credential for the `admin` alias.
