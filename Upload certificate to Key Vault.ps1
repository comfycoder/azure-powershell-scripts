
# Connect-AzureRmAccount;

$subscriptionName = 'My Subscription Name'

# Select Subscription
Select-AzureRmSubscription -SubscriptionName $subscriptionName

$certName = 'xxxcert'
$certPassword = "xxx"

$certsPath = 'C:\srcPowershell\certs\'
$pfxPath = $certsPath + $certName + '.pfx'
$txtPath = $certsPath + $certName + '.txt'

$flag = [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::Exportable 

$collection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection 

$collection.Import($pfxPath, $certPassword, $flag) 

$pkcs12ContentType = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pkcs12 

$clearBytes = $collection.Export($pkcs12ContentType) 

[System.Convert]::ToBase64String($clearBytes) | Out-File $txtPath
