#Import-Excel -Path .\50_people.xlsx | Select-object -property 'First Name', 'Last Name' | Format-Table -HideTableHeaders >> .\Names.txt

$objects = Import-Excel .\50_people.xlsx

foreach ($object in $objects) {

    $firstName = $object.'First Name'
    $lastName = $object.'Last Name'

    "$firstName $lastname" >> .\Names.txt
}