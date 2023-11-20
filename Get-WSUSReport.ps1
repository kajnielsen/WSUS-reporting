<#
.Synopsis
   Generates a short .csv 
.EXAMPLE
   Get-WSUSReport.ps1
.EXAMPLE
   Another example of how to use this cmdlet
#>

#Requires -PSEdition Desktop
#-Requires -Module ActiveDirectory
#-Requires -Module UpdateServices


function Verb-Noun
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Param1,

        # Param2 help description
        [int]
        $Param2
    )

    Begin
    {
    }
    Process
    {
    }
    End
    {
    }
}

$configuration = get-content -Raw -Path .\config.json | ConvertFrom-Json
write-host $configuration.WSUS_Servers
foreach ($server in $configuration.WSUS_Servers) {
   Write-Host $server.Name
}

<#

[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer("BORG-SCOM01.ba-reman.local",$False,8530)

$wsus.GetComputerTargetGroups()
$mygroup = $wsus.GetComputerTargetGroups() | Where-Object {$_.Name -eq "Patch Group 1.1"}

$mygroup.GetComputerTargets()

Get-ADComputer -Filter {Name -like "borg16rdstest01.BA-REMAN.LOCAL"}

((Get-ADComputer -Identity "borg16rdstest01").DistinguishedName9)

Get-ADPrincipalGroupMembership -Identity "borg16rdstest01.BA-REMAN.LOCAL"

(Get-ADPrincipalGroupMembership (Get-ADComputer "borg16rdstest01") | Where-Object {$_.name -like 'SG-WSUS-Patch-Group-X.1' }).name

#>