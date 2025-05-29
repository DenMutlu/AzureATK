$passwd = ConvertTo-SecureString "LabSMSS1" -AsPlainText -Force


New-LocalUser -Name Lab1 -Password $passwd 
Add-LocalGroupMember -Group Administrators -Member Lab1
