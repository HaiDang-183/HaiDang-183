# Lưu PID vào file khi script bắt đầu
$pidFile = "D:\Match\PushToLap_PID.txt"
$pid = $PID
$pid | Out-File -FilePath $pidFile -Force

# Đường dẫn tới file tmp.txt
$filePath = "D:\Match\pushLap.txt"

# Vòng lặp kiểm tra clipboard liên tục
while ($true) {
    try {
        # Lấy nội dung từ clipboard
        $clipboardContent = Get-Clipboard

        # Kiểm tra nếu nội dung clipboard thay đổi
        if ($clipboardContent -ne $lastClipboardContent) {
            # Cập nhật nội dung vào file
            Set-Content -Path $filePath -Value $clipboardContent -Encoding UTF8
            Write-Host "Nội dung mới đã được ghi vào tmp.txt"
            # Cập nhật nội dung clipboard cuối cùng
            $lastClipboardContent = $clipboardContent
        }
    } catch {
        Write-Host "Không thể lấy hoặc ghi nội dung clipboard. Chi tiết lỗi: $_"
    }
    # Dừng 1 giây trước khi kiểm tra lại
    Start-Sleep -Seconds 1
}
