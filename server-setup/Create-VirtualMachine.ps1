<#

.SYNOPSIS
    This script helps create a new virtual machine

.DESCRIPTION
    The script will try to create a virtual machine with a harddisk in hyper-v

.PARAMETER SwitchName
    the name of the virtual switch

.EXAMPLE
    C:\> 

.NOTES
    Must have Hyper-V compatible machine to work

.LINK 
    https://github.com/jessdev/scripts

#>

#Requires -RunAsAdministrator
Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $VirtualMachineName,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]
    $MemoryStartupBytes = "2GB",

    [Parameter(Mandatory=$false)]
    [ValidateScript({Test-Path $_})]
    [string]
    $VmParentPath = "D:\Hyper-V\VM",

    [Parameter(Mandatory=$false)]
    [ValidateScript({Test-Path $_})]
    [string]
    $HardDriveParentPath = "D:\Hyper-V\Harddrive",

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]
    $HardDriveName,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]
    $VHDSizeBytes = "60GB",

    [Parameter(Mandatory=$false)]
    [ValidateScript({Test-Path $_})]
    [string]
    $IsoParentPath = "D:\Hyper-V\OS",

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $IsoName
)

#TODO: Create Virtual Machine
# New-VM -Name "w16-01" -MemoryStartupBytes 2GB -Path D:\Hyper-V\VM\ -ErrorAction 'Stop' -Verbose -NewVHDPath D:\Hyper-V\Harddrive\w16-01-dh.vhdx -NewVHDSizeBytes 60GB
# Set-VMDvdDrive -VMName "w16-01" -Path D:\Hyper-V\OS\en_microsoft_hyper-v_server_2016_updated_feb_2018_x64_dvd_11636751.iso -ErrorAction 'Stop' -Verbose

#region Parameter Validation
if($HardDriveName -eq $null){
    $HardDriveName = "$VirtualMachineName-dh.vhdx"
    Write-Verbose -Message "HardDriveName was null. Setting it to $HardDriveName"
}

$HardDrivePath = "$HardDriveParentPath\$HardDriveName"
$IsoPath = "$IsoParentPath\$IsoName"

#endregion

New-VM -Name $VirtualMachineName -MemoryStartupBytes $MemoryStartupBytes -Path "$VmParentPath" -ErrorAction 'Stop' -Verbose -NewVHDPath $HardDrivePath -NewVHDSizeBytes "$VHDSizeBytes"\
Set-VMDvdDrive -VMName $VirtualMachineName -Path $IsoPath -ErrorAction 'Stop' -Verbose