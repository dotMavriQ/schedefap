# Schedefap
#### Scheduling Default Applications

## Description
This PowerShell script, `schedefap.ps1`, is designed to help automate the process of switching the default web browser on Windows systems based on the time and day of the week. It's particularly useful for those who prefer to use different browsers for work and personal use.

<img src="https://repository-images.githubusercontent.com/717408934/7506bb54-70f2-407f-b35e-695faa77e8f3" width="250" height="250">

## Features
- Automatically opens the Default Apps settings to prompt for a browser switch.
- Customizable schedule for browser switching (default is set to switch to Microsoft Edge during work hours and Firefox Developer Edition during off-hours and weekends).

## Prerequisites
- Windows 10/11 operating system.
- PowerShell.
- Administrative privileges (optional, but required for some features).

## Installation
1. Clone the repository or download the `schedefap.ps1` script. (placement of your choosing, suggested place is down below, replace [YourUsername] with actual username)
2. Place the script in a suitable directory, e.g., `C:\Users\[YourUsername]\Scripts`.

## Usage
1. Modify the script as needed to suit your schedule or browser preferences.
2. Manually run the script in PowerShell, or set it up as a scheduled task in Windows Task Scheduler for automatic execution.

### Running the Script Manually
Open PowerShell and navigate to the script's directory(placement of your choosing, suggested place is down below, replace [YourUsername] with actual username):
```powershell
cd C:\Users\[YourUsername]\Scripts
```
Execute the script:
```powershell
.\schedefap.ps1
```

### Setting Up a Scheduled Task
1. Open Windows Task Scheduler and create a new task.
2. Set the trigger(s) according to your preferred schedule.
3. Set the action to start `powershell.exe` with arguments `-ExecutionPolicy Bypass -File "C:\Users\[YourUsername]\Scripts\schedefap.ps1"`.

## Customization
Edit the script to change the default browsers and the schedule. The default configuration is:
- Weekdays (Monday to Friday) from 8 AM to 6 PM: Microsoft Edge.
- All other times: Firefox Developer Edition.

## Contributing
Contributions, issues, and feature requests are welcome. Feel free to check [issues page]([link-to-your-issues-page](https://github.com/dotMavriQ/schedefap/issues)) if you want to contribute.

## License
Distributed under the MIT License. See `LICENSE` for more information.

## Contact
dotMavriQ - [social@dotmavriq.life](mailto:social@dotmavriq.life)

---
