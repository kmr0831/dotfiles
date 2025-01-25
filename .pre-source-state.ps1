function has_bw {
  return (Get-Command bw.exe -ErrorAction SilentlyContinue) -ne $null
}

function bw_unlock {
  if (-not (bw.exe login --check > $null)) {
    if ($env:BITWARDEN_EMAIL) {
      bw.exe login $env:BITWARDEN_EMAIL
    } else {
      bw.exe login
    }
  } elseif (-not $env:BW_SESSION) {
    bw.exe unlock
  }
}

function install_bitwarden {
  Write-Host "bw is not installed. Installing Bitwarden CLI"
  winget install -e --id Bitwarden.CLI
}

function Main () {
  if ($env:BW_SESSION) {
    Write-Host "The BW_SESSION environment variable is already set."
    exit 0
  }

  if (has_bw) {
    bw_unlock
  } else {
    install_bitwarden
    bw_unlock
  }
}

Main
