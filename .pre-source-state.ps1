function Has-bw {
  return (Get-Command bw.exe -ErrorAction SilentlyContinue) -ne $null
}

function Login-Bitwarden {
  if (-not (bw.exe login --check > $null)) {
    bw.exe login ($env:BITWARDEN_EMAIL ?? "")
  }
}

function Install-Bitwarden {
  Write-Host "bw is not installed. Installing Bitwarden CLI"
  winget install -e --source winget --accept-source-agreements --accept-package-agreements --id Bitwarden.CLI
}

function Main () {
  if ($env:BW_SESSION) {
    Write-Host "The BW_SESSION environment variable is already set."
    exit 0
  }

  if (Has-bw) {
    Login-Bitwarden
  } else {
    Install-Bitwarden
    Login-Bitwarden
  }
}

Main
