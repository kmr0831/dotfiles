function Has-bw {
  return (Get-Command bw.exe -ErrorAction SilentlyContinue) -ne $null
}

function Login-Bitwarden {
  if (-not (bw.exe login --check > $null)) {
    if ($env:BITWARDEN_EMAIL) {
      bw.exe login $env:BITWARDEN_EMAIL
    } else {
      bw.exe login
    }
    # bw.exe login ($env:BITWARDEN_EMAIL ?? "") --> PowerShell 7 以降で使える
  }
  # if (-not (bw.exe login --check > $null)) {
  #   if ($env:BITWARDEN_EMAIL) {
  #     bw.exe login $env:BITWARDEN_EMAIL
  #   } else {
  #     bw.exe login
  #   }
  # } elseif (-not $env:BW_SESSION) {
  #   bw.exe unlock
  # }
}

function Install-Bitwarden {
  Write-Host "bw is not installed. Installing Bitwarden CLI"
  winget install -e --id Bitwarden.CLI
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
