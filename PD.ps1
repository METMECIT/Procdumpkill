if (Get-Process procdump) {
netstat -ano > C:\scripts\PD.txt
$To      = "email@domain.com" 
$From    = "PprocdumpCrunning@domain.com" 
$Subject = "procdump RUNNING" 
$Body    = "procdump RUNNING!!!!" 
# Create mail message 
$Message = New-Object System.Net.Mail.MailMessage $From, $To, $Subject, $Body 
$AttchmentText = get-content C:\scripts\PD.txt
# Now create Attachement content type
$ct = new-object System.Net.Mime.Contenttype
$ct.name = 'PD.txt'
# Now create an attachment of that type
$attachment = [System.Net.Mail.Attachment]::CreateAttachmentFromString($attchmenttext,$ct)
# Next add Attachment to the message
$message.Attachments.Add($attachment)
# and now create smtp server
$smtpServer = "domain-com.mail.protection.outlook.com"
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$smtp.Send($message)
taskkill /IM procdump.exe /F
taskkill /IM procdump64.exe /F
}
Else {
if (Get-Process procdump64) {
netstat -ano > C:\scripts\PD.txt
$To      = "email@domain.com" 
$From    = "PprocdumpCrunning@domain.com" 
$Subject = "procdump RUNNING" 
$Body    = "procdump RUNNING!!!!" 
# Create mail message 
$Message = New-Object System.Net.Mail.MailMessage $From, $To, $Subject, $Body 
$AttchmentText = get-content C:\scripts\PD.txt
# Now create Attachement content type
$ct = new-object System.Net.Mime.Contenttype
$ct.name = 'PD.txt'
# Now create an attachment of that type
$attachment = [System.Net.Mail.Attachment]::CreateAttachmentFromString($attchmenttext,$ct)
# Next add Attachment to the message
$message.Attachments.Add($attachment)
# and now create smtp server
$smtpServer = "domain-com.mail.protection.outlook.com"
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$smtp.Send($message)
taskkill /IM procdump.exe /F
taskkill /IM procdump64.exe /F
}
Else {
Break
}
