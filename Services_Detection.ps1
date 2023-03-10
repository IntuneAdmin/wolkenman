Try {
    if (Get-Service  -Name W32Time | Where-Object { $_.Status -eq "Running" }) {
        Write-host "Running"
        exit 0
    }
    else {
        throw "Service not running"
    }

}
catch {
    $errMsg = $_.Exception.Message
    write-host $errMsg
    exit 1
}