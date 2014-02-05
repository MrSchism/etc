# Toggle feature
# set-itemproperty -path $key -name DisableTaskMgr -value 1
 
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System\'
$tog = '0'
$ans = ""
$zen = ""

$title = {########################
# Task Manager Toggler #
########################

} 


cls

$title

 
if (!(Get-ItemProperty $key -Name DisableTaskMgr -ea 0)){
'Task Manager is not controlled by registry'
'would you like to create the registry value?'
'1. yes'
'2. no'
$ans = read-host

switch ($ans) {
    "yes" {(md $key) > $NULL
            cls
            New-ItemProperty "$key" -Name "DisableTaskMgr" -Value 0 -PropertyType "DWord" > $null
            $title
            "Task Manager is now able to be toggled."
            }
    1 {md $key > $null
            cls
            New-ItemProperty "$key" -Name "DisableTaskMgr" -Value 0 -PropertyType "DWord" >$null
            $title
            "Task Manager is now able to be toggled."
            }
    "no" {"Feel free to change your mind any time..."
            exit}
    2 {"Feel free to change your mind any time..."
            exit}
    default {"Feel free to change your mind any time..."
            exit}

  }
}

if (((Get-ItemProperty -Path $key -Name DisableTaskMgr).DisableTaskMgr) -eq 0) {
  'Task Manager is currently [ENABLED]'
  $tog = 0}
elseif (((Get-ItemProperty -Path $key -Name DisableTaskMgr).DisableTaskMgr) -eq 1) {
  'Task Manager is currently [DISABLED]'
  $tog = 1}

if ($tog -eq 0) {
    'Would you like to DISABLE Task Manager?'
    ''
    "1. yes"
    '2. no'
    
}
if ($tog -eq 1) {
    'Would you like to ENABLE Task Manager?'
    ''
    '1. yes'
    '2. no'
}
