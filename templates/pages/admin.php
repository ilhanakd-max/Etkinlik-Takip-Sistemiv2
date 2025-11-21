<?php if(!is_admin()) { header("Location: ?page=index"); exit; } ?>
<div class="row">
    <div class="col-md-3">
        <div class="list-group admin-nav-tabs">
            <a href="?page=admin&tab=units" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'units')=='units'?'active':''; ?>"><?php echo $lang['unit_label']; ?> Yönetimi</a>
            <a href="?page=admin&tab=events" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'')=='events'?'active':''; ?>">Raporlama & Etkinlik</a>
            <a href="?page=admin&tab=users" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'')=='users'?'active':''; ?>">Yöneticiler</a>
            <a href="?page=admin&tab=sectors" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'')=='sectors'?'active':''; ?>">Sektörler</a>
            <a href="?page=admin&tab=settings" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'')=='settings'?'active':''; ?>">Aktif Sektör Ayarı</a>
            <?php if (is_super_admin()): ?>
                <a href="?page=admin&tab=license" class="list-group-item list-group-item-action <?php echo ($_GET['tab']??'')=='license'?'active':''; ?>">Lisans Yönetimi</a>
            <?php endif; ?>
        </div>
    </div>
    <div class="col-md-9">
        <div class="card p-4">
            <?php
            $tab = $_GET['tab'] ?? 'events';
            $tab_path = "templates/partials/admin_{$tab}.php";
            if (file_exists($tab_path)) {
                include $tab_path;
            } else {
                include "templates/partials/admin_events.php";
            }
            ?>
        </div>
    </div>
</div>
