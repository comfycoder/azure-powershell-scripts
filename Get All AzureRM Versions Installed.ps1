# Connect-AzureRmAccount;

# Select Subscription
$subscriptionName = 'Visual Studio Enterprise with MSDN'
Select-AzureRmSubscription -SubscriptionName $subscriptionName

Get-InstalledModule AzureRM

Update-Module -Name "AzureRM" -RequiredVersion 6.4.0 -Force

