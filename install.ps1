if (-not (Get-Command chezmoi -errorAction SilentlyContinue)) {
  winget install -e --source winget --accept-source-agreements --accept-package-agreements --id twpayne.chezmoi
}

if (-not (Get-Command git -errorAction SilentlyContinue)) {
  winget install -e --source winget --accept-source-agreements --accept-package-agreements --id Git.Git
}

refreshenv | Out-Null
chezmoi init --apply kmr0831
