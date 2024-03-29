## Contributing Guideline

1. Clone the project:

```
git clone git@github.com:PhoenixFlockProject/content.git
```

2. Do a check pull to ensure local/main is in sync with remote/main:

```
git pull origin main
```

3. Create a feature branch for new changes:

```
git checkout -b [new-branch-name]
```

4. Before pushing your changes, sync with the latest main branch:

- Before pushing your work, check if there have been any new commits in the remote main branch since you created your feature branch.

- If there are new changes:  
  4.1 : Switch to your local `main` branch:
  ```
    git checkout main
  ```
  4.2 : Pull the latest changes from the remote `main` branch:
  ```
  git pull origin main
  ```
  4.3 : Switch back to your feature branch:
  ```
  git checkout [feature-branch-name]
  ```
  4.4 : Merge the latest `main` into your feature branch:
  ```
  git merge main
  ```

5. Add, commit and push changes:

```
git add .
git commit -m "commit message"
git push origin [new-branch-name]
```

6. Create a PR in github.

7. Merge / wait for PR to merge.

8. Delete the remote feature branch from PR page.

9. Switch to local main branch:

```
git checkout main
```

10. Update local `main` branch:

```
git pull origin main
```

11. Delete local feature branch and prune remote tracking branch:

```
git branch -d [feature-branch-name]
git fetch --prune
```

12. Repeat from step 2 for new changes.
