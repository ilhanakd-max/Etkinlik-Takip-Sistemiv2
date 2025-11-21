<div class="d-flex justify-content-between mb-3">
    <h4>Yönetici Kullanıcıları</h4>
    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#adminUserModal" onclick="newAdminUser()">Yeni Yönetici Ekle</button>
</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Kullanıcı Adı</th>
                <th>Tam Ad</th>
                <th>E-posta</th>
                <th>Rol</th>
                <th>Aktif</th>
                <th>Oluşturulma</th>
                <th>İşlemler</th>
            </tr>
        </thead>
        <tbody>
            <?php
            try {
                $admin_users = $pdo->query("SELECT id, username, full_name, email, role, is_active, created_at FROM admin_users ORDER BY username")->fetchAll();
            } catch (PDOException $e) {
                 $admin_users = [];
            }
            foreach($admin_users as $user): ?>
            <tr>
                <td><?php echo htmlspecialchars($user['username']); ?></td>
                <td><?php echo htmlspecialchars($user['full_name'] ?: '-'); ?></td>
                <td><?php echo htmlspecialchars($user['email'] ?: '-'); ?></td>
                <td><?php echo htmlspecialchars($user['role']); ?></td>
                <td><?php echo $user['is_active'] ? 'Evet' : 'Hayır'; ?></td>
                <td><?php echo turkish_date('d M Y', strtotime($user['created_at'])); ?></td>
                <td>
                    <button class="btn btn-sm btn-outline-primary"
                            onclick='editAdminUser(<?php echo json_encode($user); ?>)'>Düzenle</button>
                    <form method="post" class="d-inline" onsubmit="return confirm('Bu yöneticiyi silmek istediğinize emin misiniz?');">
                        <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
                        <input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
                        <button name="delete_admin_user" class="btn btn-sm btn-outline-danger"
                                <?php echo ($user['id'] === ($_SESSION['admin_user']['id'] ?? 0)) ? 'disabled' : ''; ?>>Sil</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
