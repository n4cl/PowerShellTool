
function get_process {
    [Diagnostics.Process[]]$ps_objs = Get-Process | Where-Object {$_.MainWindowTitle -ne ""}
    return $ps_objs
}

function is_running_by_main_window_title($title) {
    $ps_objs = get_process
    foreach ($ps in $ps_objs) {
        if ($ps.MainWindowTitle -eq $title) {
            return $ps.MainWindowTitle
        }
    }
}

function is_running_by_process_name($psname) {
    $ps_objs = get_process
    foreach ($ps in $ps_objs) {
        if ($ps.ProcessName -eq $psname) {
            return $ps.ProcessName
        }
    }
}
