<?php
    $all_sectors = [];
    try {
        $all_sectors = $pdo->query("SELECT * FROM app_sectors ORDER BY sector_name")->fetchAll();
    } catch (PDOException $e) {
        echo '<div class="alert alert-danger">Sektör tablosu bulunamadı. Lütfen SQL Adım 1\'deki sorguyu çalıştırın.</div>';
    }
?>
<div class="d-flex justify-content-between mb-3">
    <h4>Sektör Yönetimi</h4>
    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#sectorModal" onclick="newSector()">Yeni Sektör Ekle</button>
</div>
<?php if (!empty($all_sectors)): ?>
<div class="table-responsive">
    <table class="table table-hover">
        <thead><tr>
            <th>Anahtar</th><th>Ad</th><th>Birim Etiketi</th><th>Etkinlik Etiketi</th><th>Durum</th><th>İşlem</th>
        </tr></thead>
        <tbody>
            <?php foreach($all_sectors as $s): ?>
            <tr>
                <td><strong><?php echo htmlspecialchars($s['sector_key']); ?></strong></td>
                <td><?php echo htmlspecialchars($s['sector_name']); ?></td>
                <td><?php echo htmlspecialchars($s['unit_label']); ?></td>
                <td><?php echo htmlspecialchars($s['event_label']); ?></td>
                <td><?php echo $s['is_active'] ? 'Aktif' : 'Pasif'; ?></td>
                <td>
                    <button class="btn btn-sm btn-outline-primary" onclick='editSector(<?php echo json_encode($s); ?>)'>Düzenle</button>
                    <form method="post" class="d-inline" onsubmit="return confirm('Bu sektörü silmek istediğinize emin misiniz? Anahtar: <?php echo $s['sector_key']; ?>');">
                        <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
                        <input type="hidden" name="sector_key" value="<?php echo $s['sector_key']; ?>">
                        <button name="delete_sector" class="btn btn-sm btn-outline-danger" <?php echo ($s['sector_key'] == $active_sector) ? 'disabled' : ''; ?>>Sil</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<?php endif; ?>
