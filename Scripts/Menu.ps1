$MenuDescription = "Dynamic File Menu "

# Sets Custom PowerShell Window size.
Function Set-WindowSize {
    Param([int]$x = $host.ui.rawui.windowsize.width,
        [int]$y = $host.ui.rawui.windowsize.heigth)
    
    $size = New-Object System.Management.Automation.Host.Size($x, $y)
    $host.ui.rawui.WindowSize = $size   
}

Set-WindowSize 30 20

# Chnages PowerShell console background to black.
$Host.UI.RawUI.BackgroundColor = ('Black')


$Path = "C:\Users\User\Desktop\Scripts"

$CurrentPath = $Path

$filter = "*$name*"

# Get a list of Active Directories/Files User objects.
$List = @(Get-ChildItem -Path $Path -Filter $filter)

# Check if .ps1 file has $MenuDescription variale inside it,
# then remove's all unnecessary symbols and prints it to the console.
function DescriptionCheck() {
    if ($item.name -match '.ps1') {
        $Value = Get-Content "$($CurrentPath)\$($item.name)" -First 1
        if ($Value -Match "MenuDescription") {
            $rightPart = $Value.Substring($Value.IndexOf("=") + 3)
            $rightPart = $rightPart.Substring(0, $rightPart.Length - 1)
            write-Host  " - $($rightPart)"
        }
        $Value = $null
    }
}

# Create a menu function
function menuFunction {
    param ($list) 
    clear-host
    $CurrentDir = Split-Path $CurrentPath -Leaf
    write-host
    write-host "************ $($CurrentDir) ************"
    $i = 1
    # Create a dynamic menu item for each array object
    foreach ($item in $List) {
        # Checks if item is File or Directory, and sets needed color.
        $itemColor = if ( -not $item.PSIsContainer) { "White" }else { "DarkGray" }
        write-host "[$i] $($item.name)" -fore $itemColor
        DescriptionCheck $item.name
        $i++
    }

    # IF $List variable is null, print's "Nothing Found"
    if ( -Not $List ) {
        write-host "404 ERROR!`nNothing Found." -fore red 
    }

    write-host "[S] Search" -fore DarkGreen
    write-host "[B] Back" -fore DarkGreen
    write-host "[Q] Quit" -fore DarkGreen
    write-host

    $selection = read-host "Select a menu option"

    # Check if selection is a number
    if ($selection -match "^\d+$") {

        # Set $choice variable to the selected $list array object
        $choice = $($List[$selection - 1]) 
    }
    else {
        # If selection is not a number
        $choice = $selection
    }
    #return selected array object or static menu selection
    return $choice; 
}


Do {
    $choice = menuFunction $list
    write-host
    switch ($choice) {
        # Match if $list array contains the $selected $choice object.
        { $list -contains $choice } {

            write-host "You chose $($choice.name). Excellent choice." -fore green

            # Check if $choice is not container.
            if ( -not $choice.PSIsContainer) {

                # If $choice is PowerShell file, it opens it as a command, otherwise just opens it.
                if ($choice.name -match '.ps1') {
                    Invoke-Expression -command "$($CurrentPath)\$($choice.name)"
                }
                else {
                    Invoke-Item -path "$($CurrentPath)\$($choice.name)"
                }

            }
            else {
                # Sets current path.
                $CurrentPath = "$($CurrentPath)\$($choice.name)"
                # Gets all files and directories from current folder.
                $list = @(Get-ChildItem -Path $CurrentPath -Filter $filter) 

            }
        }
        # Quit's if menu choice was "Q".
        q { exit }
        
        # Moves one directory backward and updates list.
        b {
            $BackPath = Resolve-Path (Join-Path $CurrentPath '..')
            $CurrentPath = Resolve-Path (Join-Path $CurrentPath '..')
            $list = @(Get-ChildItem -Path $BackPath -Filter $filter)  
        }

        #Search files && Directories by keyword.
        s {
            write-host "[ENTER] Main menu" -fore DarkGreen
            $name = Read-host "Enter a name" 
            $filter = "*$name*"
            $list = @(Get-ChildItem -Path $CurrentPath -Filter $filter)    
            $CurrentPath = $Path
        }

        default { write-host "Invalid menu choice" -fore red }  
    }

}until ($choice -eq "q")