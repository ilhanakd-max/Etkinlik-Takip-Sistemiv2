<div class="d-flex justify-content-between mb-3">
    <h4><?php echo $lang['unit_label']; ?> Listesi</h4>
    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#unitModal" onclick="newUnit()">Yeni <?php echo $lang['unit_label']; ?> Ekle</button>
</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead><tr><th>Ad</th><th>Renk</th><th>Durum</th><th>İşlem</th></tr></thead>
        <tbody>
            <?php
            $all_units = $pdo->query("SELECT * FROM units ORDER BY unit_name")->fetchAll();
            foreach($all_units as $u): ?>
            <tr>
                <td><?php echo htmlspecialchars($u['unit_name']); ?></td>
                <td><span class="badge" style="background-color:<?php echo $u['color']; ?>"><?php echo $u['color']; ?></span></td>
                <td><?php echo $u['is_active']?'Aktif':'Pasif'; ?></td>
                <td>
                    <button class="btn btn-sm btn-outline-primary" onclick='editUnit(<?php echo json_encode($u); ?>)'>Düzenle</button>
                    <form method="post" class="d-inline" onsubmit="return confirm('Bu kaydı silmek tüm ilgili etkinlikleri etkileyecektir. Emin misiniz?')">
                        <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
                        <input type="hidden" name="table" value="units">
                        <input type="hidden" name="id" value="<?php echo $u['id']; ?>">
                        <button name="delete_item" class="btn btn-sm btn-outline-danger">Sil</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
