# Contributing Guide

### Table Of Contents

* [1. Commit messages](#1-commit-messages)
  * [1.1. Type](#11-type)
  * [1.2. Scope](#12-scope)
  * [1.3. Subject](#13-subject)
* [2. Pull requests](#2-pull-requests)

## 1. Commit Messages

Commit messages lean heavily towards the convention set out by [conventional commits](https://www.conventionalcommits.org).

Each commit message must be in the format that includes a **type**, an optional **scope** and a **subject**:
```
type(scope?): subject  #scope is optional
```

Limit the whole message to 72 characters or less!

Example:

```
build(terraform): burn it all down
```

### 1.1. Type

Must be one of the following:

* **build**: Changes that affect the build system or external dependencies (example scopes: npm)
* **chore**: Changes that don't really fall under any other type
* **ci**: Changes to the CI configuration files and scripts
* **docs**: Documentation only changes
* **feat**: A new feature
* **fix**: A bug fix
* **perf**: A code change that improves performance
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **revert**: Revert a previous commit
* **test**: Adding missing tests or correcting existing tests

### 1.2. Scope

A scope may be provided to a commit’s type, to provide additional contextual information and is contained within a parenthesis

### 1.3. Subject

The subject contains a succinct description of the change:

* use the present tense ("Add feature" not "Added feature")
* use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* don't capitalise the first letter
* don't use a fullstop (.) at the end. <- Not this

<sup>[Back to top ^](#table-of-contents)</sup>

## 2. Pull Requests

1. Create a branch from the `main` branch and use the convention: `<feat|fix|build>/name-of-issue`.
2. Once the code is ready to be merged into `main`, open a pull request.
3. 
> ⚠️**NOTE:** The title must conform to the conventional commit message format outlined above...

3. To merge the PR, use the "Squash and merge" option. This is to keep the commit history clean and keep the commits on `main` with a 1:1 ratio with previous PRs.

<sup>[Back to top ^](#table-of-contents)</sup>
