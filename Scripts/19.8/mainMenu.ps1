. "./SubMenu/subMenu1.ps1"
. "./SubMenu/subMenu2.ps1"

function mainMenu { 
    $mainMenu = 'X'
    while ($mainMenu -ne '') {
        Clear-Host
        Write-Host "`n`t`t My Script `n"
        Write-Host "Main Menu"
        Write-Host -NoNewLine " `n["; Write-Host -NoNewLine "1"; Write-Host -NoNewLine "]"; `
            Write-Host " First Day"
        Write-Host -NoNewLine " `n["; Write-Host -NoNewLine "2"; Write-Host -NoNewLine "]"; `
            Write-Host " Second Day"
        $mainMenu = Read-Host "`nSelection (Leave blank to quit)"
        if ($mainMenu -eq 1) {
            $mainMenu = ''
            subMenu1

        }
        if ($mainMenu -eq 2) {
            $mainMenu = ''
            #wifiPass
        }
    }
}
function GuiMenu {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = 'Data Entry Form'
    $form.Size = New-Object System.Drawing.Size(350, 200)
    $form.StartPosition = 'CenterScreen'

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(75, 120)
    $okButton.Size = New-Object System.Drawing.Size(75, 23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Location = New-Object System.Drawing.Point(150, 120)
    $cancelButton.Size = New-Object System.Drawing.Size(75, 23)
    $cancelButton.Text = 'Cancel'
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $cancelButton
    $form.Controls.Add($cancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10, 20)
    $label.Size = New-Object System.Drawing.Size(280, 20)
    $label.Text = 'pökäle'
    $form.Controls.Add($label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point(10, 40)
    $textBox.Size = New-Object System.Drawing.Size(260, 20)
    $form.Controls.Add($textBox)

    $form.Topmost = $true

    $form.Add_Shown( { $textBox.Select() })
    $result = $form.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $x = $textBox.Text
        $x
    }
}
mainMenu