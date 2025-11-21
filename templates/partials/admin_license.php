<?php if (!is_super_admin()): ?>
    <div class="alert alert-danger">Bu alan sadece süper admin tarafından kullanılabilir.</div>
<?php else:
    $license_error = '';
    try {
        $license_info = fetch_license_expire_date($pdo);
    } catch (PDOException $e) {
        $license_info = null;
        $license_error = 'Lisans bilgisi okunurken hata oluştu: ' . $e->getMessage();
    }
?>
    <h4>Lisans Yönetimi</h4>
    <p>Sistemin kullanım süresini buradan uzatabilirsiniz. Lisans süresi dolduğunda yalnızca süper admin giriş yapabilir.</p>
    <?php if ($license_error): ?>
        <div class="alert alert-warning"><?php echo htmlspecialchars($license_error); ?></div>
    <?php endif; ?>
    <form method="post" class="mt-3">
        <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
        <div class="mb-3">
            <label class="form-label">Lisans Bitiş Tarihi</label>
            <input type="date" name="license_expire_date" class="form-control" value="<?php echo htmlspecialchars($license_info['license_expire_date'] ?? date('Y-m-d', strtotime('+30 days'))); ?>" required>
        </div>
        <button type="submit" name="save_license" class="btn btn-primary">Lisans Tarihini Güncelle</button>
    </form>
    <?php if (!empty($license_info['updated_at'])): ?>
        <p class="text-muted mt-3"><small>Son Güncelleme: <?php echo turkish_date('d M Y H:i', strtotime($license_info['updated_at'])); ?></small></p>
    <?php endif; ?>
<?php endif; ?>
