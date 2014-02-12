######################################################################################
# Task Manager Toggler written by: 									
#   Joshua "MrSchism" Embrey [mrschism@sdf.org]					
#   Joseph "Arcarna" Preston [jpreston86@gmail.com]					
# Intial commit: February 5, 2014 							
# Current version: February 12, 2014							
######################################################################################

# Variables
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System\'
$tog = 0
$ans = ""
$zen = ""

$title = {########################
# Task Manager Toggler #
########################

} 

# Start clean
cls

# Throw the title
$title

# Check for key existence and offer to make it if absent.
if(!(Get-ItemProperty $key -Name DisableTaskMgr -ea 0)){
    'Task Manager is not controlled by registry.'
    'Would you like to create the registry value?'
    ''
    '1. yes'
    '2. no'
    $ans = read-host

    switch ($ans) {
        "yes" {(md $key) > $NULL
            cls
            New-ItemProperty "$key" -Name "DisableTaskMgr" -Value 0 -PropertyType "DWord" > $null
            $title
            "Task Manager is now able to be toggled."
            ''
        }
        
        1 {md $key > $null
            cls
            New-ItemProperty "$key" -Name "DisableTaskMgr" -Value 0 -PropertyType "DWord" >$null
            $title
            "Task Manager is now able to be toggled."
            ''
        }
        "no" {"Feel free to change your mind any time..."
            exit}
        2 {"Feel free to change your mind any time..."
            exit}
        default {"Feel free to change your mind any time..."
            exit}

    }
}

# Describes if the task manager is enabled and sets the toggle ($tog) variable
if(((Get-ItemProperty -Path $key -Name DisableTaskMgr).DisableTaskMgr) -eq 0) {
    'Task Manager is currently [ENABLED]'
    $tog = 0}
elseif(((Get-ItemProperty -Path $key -Name DisableTaskMgr).DisableTaskMgr) -eq 1) {
    'Task Manager is currently [DISABLED]'
    $tog = 1}

# Offers to enable or disable based on the state of $tog
if ($tog -eq 0) {
    'Would you like to DISABLE Task Manager?'
    ''
    '1. yes'
    '2. no'
    $zen = read-host
        switch ($zen) {
            "yes" {set-itemproperty -path $key -name DisableTaskMgr -value 1
                    ''
                    'Task Manager has been DISABLED.'
                    }
            1 {set-itemproperty -path $key -name DisableTaskMgr -value 1
                    ''
                    'Task Manager has been DISABLED.'
                    }
            "no" {''
                    "Feel free to change your mind any time..."
                    exit}
            2 {''
                    "Feel free to change your mind any time..."
                    exit}
            default {''
                    "Feel free to change your mind any time..."
                    exit}
    }
}
if ($tog -eq 1) {
    'Would you like to ENABLE Task Manager?'
    ''
    '1. yes'
    '2. no'
    $zen = read-host
        switch ($zen) {
            "yes" {set-itemproperty -path $key -name DisableTaskMgr -value 0
                    ''
                    'Task Manager has been ENABLED.'
                    }
            1 {set-itemproperty -path $key -name DisableTaskMgr -value 0
                    ''
                    'Task Manager has been ENABLED.'
                    }
            "no" {''
                    "Feel free to change your mind any time..."
                    exit}
            2 {''
                    "Feel free to change your mind any time..."
                    exit}
            default {''
                    "Feel free to change your mind any time..."
                    exit}

    }
}
