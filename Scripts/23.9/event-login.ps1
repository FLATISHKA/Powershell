$end = Get-Date
$begin = (Get-Date $end).AddMonths(-1)

Get-EventLog -LogName System -EntryType Error -After $begin -Before $end