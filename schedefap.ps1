function Get-BrowserNameFromProgId {
    param ($progId)

    switch -Regex ($progId) {
        "MSEdge" { return "Microsoft Edge" }
        "Firefox" { return "Firefox Developer Edition" }
        default { return "Unknown Browser" }
    }
}

function Get-DefaultBrowserAppID {
    try {
        # Attempt to read the default browser AppID from the registry
        $browserRegPath = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
        $defaultBrowser = Get-ItemProperty -Path $browserRegPath -Name "ProgId"
        return $defaultBrowser.ProgId
    } catch {
        Write-Warning "Could not determine the default browser."
        return $null
    }
}

# Define the expected ProgIds for Microsoft Edge and Firefox Developer Edition
$edgeProgId = "MSEdgeHTM" # This might vary based on your system
$firefoxDevProgId = "FirefoxURL-CA9422711AE1A81C" # This might vary based on your system

$currentDay = (Get-Date).DayOfWeek
$currentHour = (Get-Date).Hour

# Determine the expected default browser ProgId based on the time
$expectedBrowserProgId = ""
if ($currentDay -ge [System.DayOfWeek]::Monday -and $currentDay -le [System.DayOfWeek]::Friday) {
    if ($currentHour -ge 8 -and $currentHour -lt 18) {
        $expectedBrowserProgId = $edgeProgId
    } else {
        $expectedBrowserProgId = $firefoxDevProgId
    }
} else {
    $expectedBrowserProgId = $firefoxDevProgId
}

# Get the current default browser's ProgId
$currentDefaultBrowserProgId = Get-DefaultBrowserAppID
$currentDefaultBrowserName = Get-BrowserNameFromProgId -progId $currentDefaultBrowserProgId

# Check if the current default browser's ProgId is as expected
if ($currentDefaultBrowserProgId -ne $expectedBrowserProgId) {
    Write-Host "Current default browser is not set as expected. It's currently set to $currentDefaultBrowserName."
    Start-Process "ms-settings:defaultapps"
} else {
    Write-Host "The default browser is already set correctly to $currentDefaultBrowserName."
}
