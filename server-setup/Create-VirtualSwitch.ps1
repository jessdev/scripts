<#

.SYNOPSIS
    This is a simple Powershell script to create an external virtual switch

.DESCRIPTION
    The script will try to create a virtual switch using the first physical network adapter it can find.

.PARAMETER SwitchName
    the name of the virtual switch

.EXAMPLE
    C:\> ./Create-VirtualSwitch -SwitchName 'MyFavoriteSwitch01'

.NOTES
    Must have Hyper-V compatible machine to work

.LINK 
    https://github.com/jessdev/scripts

#>


Param(
  [string]
  $SwitchName
)

$physicalAdapterList = Get-NetAdapter -Physical
$adapter = $physicalAdapterList[0]

New-VMSwitch -Name $SwitchName -AllowManagementOS $true -NetAdapterName $adapter.Name